//
//  GameViewController.m
//  GlobeMaterial
//
//  Created by Anik on 5/9/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController(){
    SCNNode *globeNode;
}

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // create a new scene
    //SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/ship.scn"];
    SCNScene *scene = [[SCNScene alloc] init];
    
    globeNode = [[SCNNode alloc] init];
    
    SCNSphere* globeSphare = [SCNSphere sphereWithRadius:2.0f];
    globeSphare.firstMaterial.diffuse.contents = [UIImage imageNamed:@"diffuse.png"];
    globeSphare.firstMaterial.specular.contents = [UIImage imageNamed:@"specular.png"];
    globeSphare.firstMaterial.normal.contents = [UIImage imageNamed:@"normal.png"];
    globeSphare.firstMaterial.transparent.contents = [UIImage imageNamed:@"transparent.png"];
    
    SCNNode *carbonNode = [SCNNode nodeWithGeometry:globeSphare];
    carbonNode.position = SCNVector3Make(0,0,0);
    [globeNode addChildNode:carbonNode];
    
    [scene.rootNode addChildNode:globeNode];

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
}

- (void) handleTap:(UIGestureRecognizer*)gestureRecognize
{
    // retrieve the SCNView
    SCNView *scnView = (SCNView *)self.view;
    
    // check what nodes are tapped
    CGPoint p = [gestureRecognize locationInView:scnView];
    
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
