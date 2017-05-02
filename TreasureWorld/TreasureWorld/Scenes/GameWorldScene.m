//
//  GameWorldScene.m
//  TreasureWorld
//
//  Created by Anik on 4/25/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

#import "GameWorldScene.h"
#import "WorldNode.h"

@implementation GameWorldScene

-(instancetype)init{
    self = [super init];
    SCNNode *worldNode = [[WorldNode alloc] init];
    [self.rootNode addChildNode:worldNode];
    
    // create and add a light to the scene
    SCNNode *lightNode = [SCNNode node];
    lightNode.light = [SCNLight light];
    lightNode.light.type = SCNLightTypeOmni;
    lightNode.position = SCNVector3Make(0, 500, 0);
    [self.rootNode addChildNode:lightNode];
    
    // create and add an ambient light to the scene
    SCNNode *ambientLightNode = [SCNNode node];
    ambientLightNode.light = [SCNLight light];
    ambientLightNode.light.type = SCNLightTypeAmbient;
    ambientLightNode.light.color = [UIColor darkGrayColor];
    [self.rootNode addChildNode:ambientLightNode];
    
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    cameraNode.position = SCNVector3Make(-3.0, 3.0, 3.0);
 //   [self.rootNode addChildNode:cameraNode];
    
    
    SCNLookAtConstraint *constraint = [SCNLookAtConstraint lookAtConstraintWithTarget:worldNode];
 //   constraint.gimbalLockEnabled = true;
    cameraNode.constraints = @[constraint];
    
    return self;
}
@end
