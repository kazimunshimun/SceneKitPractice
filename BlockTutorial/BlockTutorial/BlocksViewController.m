//
//  BlocksViewController.m
//  BlockTutorial
//
//  Created by Anik on 4/1/17.
//  Copyright © 2017 A7Studio. All rights reserved.
//

#import "BlocksViewController.h"
#import <SceneKit/SceneKit.h>
#import "Blocks.h"

@interface BlocksViewController (){
    SCNNode *worldNode;
}
@property (weak, nonatomic) IBOutlet SCNView *worldView;

@end

@implementation BlocksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    worldNode = [[SCNNode alloc] init];
    [self initializeWorld];
}

-(void) initializeWorld{
    SCNScene *scene = [[SCNScene alloc] init];
    
    worldNode = [Blocks allBlocks];
    [scene.rootNode addChildNode:worldNode];
    
    // create and add a camera to the scene
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    [scene.rootNode addChildNode:cameraNode];
    
    // place the camera
    cameraNode.position = SCNVector3Make(10, 10, 35);
    
    SCNNode *ambientLightNode = [[SCNNode alloc] init];
    ambientLightNode.light = [[SCNLight alloc] init];
    ambientLightNode.light.type = SCNLightTypeOmni;
    ambientLightNode.light.color = [UIColor colorWithWhite:0.75f alpha:1.0f];
    ambientLightNode.position = SCNVector3Make(0, 50, 50);
    [scene.rootNode addChildNode:ambientLightNode];
    
    self.worldView.scene = scene;
    // allows the user to manipulate the camera
    self.worldView.allowsCameraControl = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
