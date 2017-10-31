//
//  GameViewController.m
//  SceneKit3DTutorial
//
//  Created by Anik on 10/31/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

#import "GameViewController.h"

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SCNScene *scene = [SCNScene scene];
    self.sceneView.scene = scene;
    
 //   CGFloat boxSide = 7.0;
    CGFloat boxSideWidth = 9.0;
    CGFloat boxSideHeight = 2.0;
    CGFloat boxSideLength = 5.0;
    SCNBox *box = [SCNBox boxWithWidth:boxSideWidth
                                height:boxSideHeight
                                length:boxSideLength
                         chamferRadius:0];
    
    SCNMaterial *greenMaterial = [SCNMaterial material];
    greenMaterial.diffuse.contents = [UIColor greenColor];
    
    SCNMaterial *redMaterial = [SCNMaterial material];
    redMaterial.diffuse.contents = [UIColor redColor];
    
    SCNMaterial *blueMaterial = [SCNMaterial material];
    blueMaterial.diffuse.contents = [UIColor blueColor];
    
    SCNMaterial *yellowMaterial = [SCNMaterial material];
    yellowMaterial.diffuse.contents = [UIColor yellowColor];
    
    SCNMaterial *purpleMaterial = [SCNMaterial material];
    purpleMaterial.diffuse.contents = [UIColor purpleColor];
    
    SCNMaterial *magentaMaterial = [SCNMaterial material];
    magentaMaterial.diffuse.contents = [UIColor magentaColor];
    
    box.materials = @[greenMaterial, redMaterial, blueMaterial, yellowMaterial, purpleMaterial, magentaMaterial];
    
    //box
    SCNNode *boxNode = [SCNNode nodeWithGeometry:box];
    boxNode.rotation = SCNVector4Make(0, 1, 0, M_PI/5.0);
    [scene.rootNode addChildNode:boxNode];
    
    //sphere
    CGFloat sphereRadius = 2.0;
    SCNSphere *sphere = [SCNSphere sphereWithRadius:sphereRadius];
    
    SCNNode *sphereNode = [SCNNode nodeWithGeometry:sphere];
    sphereNode.position = SCNVector3Make(0.0, 4.0, 0.0);
  //  [scene.rootNode addChildNode:sphereNode];
    
    //cone
    CGFloat topRadius = 0.0;
    CGFloat bottomRadius = 1.5;
    CGFloat coneHeight = 3.0;
    SCNCone *cone = [SCNCone coneWithTopRadius:topRadius bottomRadius:bottomRadius height:coneHeight];
    
    SCNNode *coneNode = [SCNNode nodeWithGeometry:cone];
    coneNode.position = SCNVector3Make(4.0, 4.0, 0.0);
   // [scene.rootNode addChildNode:coneNode];
    
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    cameraNode.position = SCNVector3Make(0, 10, 20);
    cameraNode.rotation = SCNVector4Make(1, 0, 0, -atan2f(10.0, 20.0));
    [scene.rootNode addChildNode:cameraNode];
    
    UIColor *lightBlueColor = [UIColor colorWithRed:4.0/255.0
                                              green:120.0/255.0
                                               blue:255.0/255.0
                                              alpha:1.0];
    
    SCNLight *light = [SCNLight light];
    light.type = SCNLightTypeDirectional;
    light.color = lightBlueColor;
    
    SCNNode *lightNode = [SCNNode node];
    lightNode.light = light;
    [cameraNode addChildNode:lightNode];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
