//
//  GameViewController.m
//  TreasureWorld
//
//  Created by Anik on 4/25/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

#import "GameViewController.h"
#import "GameWorldScene.h"

@interface GameViewController(){
    
    SCNNode *cameraOrbit;
    SCNNode *cameraNode;
    SCNCamera *camera;
}
@property (strong, nonatomic) IBOutlet SCNView *worldView;

@end

//HANDLE PAN CAMERA
CGFloat lastWidthRatio = 0;
CGFloat lastHeightRatio = 0.2;
int fingersNeededToPan = 1;
CGFloat maxWidthRatioRight = 0.2;
CGFloat maxWidthRatioLeft = -0.2;
CGFloat maxHeightRatioXDown = 0.02;
CGFloat maxHeightRatioXUp = 0.4;

//HANDLE PINCH CAMERA
CGFloat pinchAttenuation = 20.0;  //1.0: very fast ---- 100.0 very slow
int lastFingersNumber = 0;

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

   // self.worldView.scene = [[GameWorldScene alloc] init];
    
    SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/simple_island_5.scn"];
    self.worldView.scene = scene;
    
    //[self drawPiramid];
    // allows the user to manipulate the camera
    //self.worldView.allowsCameraControl = YES;
    
    // show statistics such as fps and timing information
    self.worldView.showsStatistics = YES;
    [self createCameraNode];
    
    // add a tap gesture recognizer
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.worldView addGestureRecognizer:panGesture];
    
    //allows the user to manipulate the camera
    self.worldView.allowsCameraControl = NO;  //not needed
    
    /*
    // create a new scene
    SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/ship.scn"];

    // create and add a camera to the scene
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    [scene.rootNode addChildNode:cameraNode];
    
    // place the camera
    cameraNode.position = SCNVector3Make(0, 0, 15);
    
    // create and add a light to the scene
    SCNNode *lightNode = [SCNNode node];
    lightNode.light = [SCNLight light];
    lightNode.light.type = SCNLightTypeOmni;
    lightNode.position = SCNVector3Make(0, 10, 10);
    [scene.rootNode addChildNode:lightNode];
    
    // create and add an ambient light to the scene
    SCNNode *ambientLightNode = [SCNNode node];
    ambientLightNode.light = [SCNLight light];
    ambientLightNode.light.type = SCNLightTypeAmbient;
    ambientLightNode.light.color = [UIColor darkGrayColor];
    [scene.rootNode addChildNode:ambientLightNode];
    
    // retrieve the ship node
    SCNNode *ship = [scene.rootNode childNodeWithName:@"ship" recursively:YES];
    
    // animate the 3d object
    [ship runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:2 z:0 duration:1]]];
    
    // retrieve the SCNView
    SCNView *scnView = (SCNView *)self.view;
    
    // set the scene to the view
    scnView.scene = scene;
    
    // allows the user to manipulate the camera
    scnView.allowsCameraControl = YES;
        
    // show statistics such as fps and timing information
    scnView.showsStatistics = YES;

    // configure the view
    scnView.backgroundColor = [UIColor blackColor];
    
    // add a tap gesture recognizer
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    NSMutableArray *gestureRecognizers = [NSMutableArray array];
    [gestureRecognizers addObject:tapGesture];
    [gestureRecognizers addObjectsFromArray:scnView.gestureRecognizers];
    scnView.gestureRecognizers = gestureRecognizers;
     */
}

-(void) createCameraNode{
    //Create a camera like Rickster said
    camera = [[SCNCamera alloc] init];
    camera.usesOrthographicProjection = true;
    camera.orthographicScale = 9;
    camera.zNear = 1;
    camera.zFar = 100;
    
    cameraNode = [[SCNNode alloc] init];
    cameraNode.position = SCNVector3Make(0, 0, 50);
    cameraNode.camera = camera;
    
    cameraOrbit = [[SCNNode alloc] init];
    [cameraOrbit addChildNode:cameraNode];
    [self.worldView.scene.rootNode addChildNode:cameraOrbit];
    
    //initial camera setup
    [cameraOrbit setEulerAngles:SCNVector3Make((CGFloat)(-M_PI) * lastHeightRatio, (-2 * M_PI) * lastWidthRatio, 1)];
}

- (void) handlePan:(UIPanGestureRecognizer*)gestureRecognize{
    
    NSUInteger numberOfTouches = gestureRecognize.numberOfTouches;
    
    CGPoint translation = [gestureRecognize translationInView:gestureRecognize.view];
    float widthRatio = (float)translation.x / (float)gestureRecognize.view.frame.size.width + lastWidthRatio;
    float heightRatio = (float)translation.y / (float)gestureRecognize.view.frame.size.height + lastHeightRatio;
    
    if (numberOfTouches==fingersNeededToPan) {
        
        //  HEIGHT constraints
        if (heightRatio >= maxHeightRatioXUp ) {
            heightRatio = maxHeightRatioXUp;
        }
        if (heightRatio <= maxHeightRatioXDown ) {
            heightRatio = maxHeightRatioXDown;
        }
        
        
        //  WIDTH constraints
        if(widthRatio >= maxWidthRatioRight) {
            widthRatio = maxWidthRatioRight;
        }
        if(widthRatio <= maxWidthRatioLeft) {
            widthRatio = maxWidthRatioLeft;
        }
        
        [cameraOrbit setEulerAngles:SCNVector3Make((float)(-M_PI) * heightRatio, (float)(-2 * M_PI) * widthRatio, 1)];
        //print("Height: \(round(heightRatio*100))")
        //print("Width: \(round(widthRatio*100))")
        
        
        //for final check on fingers number
        lastFingersNumber = fingersNeededToPan;
    }
    
    lastFingersNumber = (numberOfTouches>0 ? numberOfTouches : lastFingersNumber);
    
    if (gestureRecognize.state == UIGestureRecognizerStateEnded && lastFingersNumber==fingersNeededToPan) {
        lastWidthRatio = widthRatio;
        lastHeightRatio = heightRatio;
    }
    
}

- (void) handlePich:(UIPinchGestureRecognizer*)gestureRecognize{
    
}

- (void) handleTap:(UIGestureRecognizer*)gestureRecognize
{
    /*
    // retrieve the SCNView
    SCNView *scnView = (SCNView *)self.view;
    
    // check what nodes are tapped
    CGPoint p = [gestureRecognize locationInView:scnView];
    NSArray *hitResults = [scnView hitTest:p options:nil];
    
    // check that we clicked on at least one object
    if([hitResults count] > 0){
        // retrieved the first clicked object
        SCNHitTestResult *result = [hitResults objectAtIndex:0];
        
        // get its material
        SCNMaterial *material = result.node.geometry.firstMaterial;
        
        // highlight it
        [SCNTransaction begin];
        [SCNTransaction setAnimationDuration:0.5];
        
        // on completion - unhighlight
        [SCNTransaction setCompletionBlock:^{
            [SCNTransaction begin];
            [SCNTransaction setAnimationDuration:0.5];
            
            material.emission.contents = [UIColor blackColor];
            
            [SCNTransaction commit];
        }];
        
        material.emission.contents = [UIColor redColor];
        
        [SCNTransaction commit];
    }
     */
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
