//
//  WorldNode.m
//  TreasureWorld
//
//  Created by Anik on 4/25/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

#import "WorldNode.h"

@implementation WorldNode

-(instancetype)init{
    self = [super init];
    
    SCNNode *blockNode = [SCNNode nodeWithGeometry:[self block]];
    blockNode.position = SCNVector3Make(0, 0, 0);
    [self addChildNode:blockNode];
    
    return self;
}

-(SCNGeometry *) block{
    
    SCNBox *boxGeometry = [SCNBox boxWithWidth:2000 height:20.0 length:1500 chamferRadius:0.01f];
 //   boxGeometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"tiles1"];
    boxGeometry.firstMaterial.diffuse.contents = [UIColor yellowColor];
    boxGeometry.firstMaterial.specular.contents = [UIColor whiteColor];
    return boxGeometry;
}
@end
