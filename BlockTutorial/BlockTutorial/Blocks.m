//
//  Blocks.m
//  BlockTutorial
//
//  Created by Anik on 3/31/17.
//  Copyright © 2017 A7Studio. All rights reserved.
//

#import "Blocks.h"


@implementation Blocks

+(SCNGeometry *) block{
    
    SCNBox *boxGeometry = [SCNBox boxWithWidth:3.0f height:0.2f length:3.0f chamferRadius:0.01f];
    boxGeometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"tiles1"];
    boxGeometry.firstMaterial.specular.contents = [UIColor whiteColor];
    
    return boxGeometry;
}

+(SCNGeometry *) drawWall{
    
    SCNBox *boxGeometry = [SCNBox boxWithWidth:60.0f height:20.0f length:0.2f chamferRadius:0.0f];
    boxGeometry.firstMaterial.diffuse.contents = [UIColor lightGrayColor];
    boxGeometry.firstMaterial.specular.contents = [UIColor whiteColor];
    
    return boxGeometry;
}

+(SCNGeometry *) drawWallSide{
    
    SCNBox *boxGeometry = [SCNBox boxWithWidth:0.2f height:20.0f length:60.0f chamferRadius:0.0f];
    boxGeometry.firstMaterial.diffuse.contents = [UIColor lightGrayColor];
    boxGeometry.firstMaterial.specular.contents = [UIColor whiteColor];
    
    return boxGeometry;
}

+(SCNNode *) allBlocks{
    SCNNode *blocksNode = [[SCNNode alloc] init];
    
    SCNNode *wallBackNode = [SCNNode nodeWithGeometry:[self drawWall]];
    wallBackNode.position = SCNVector3Make(28.5f,10,-1.5f);
    [blocksNode addChildNode:wallBackNode];
    
    
    SCNNode *wallLeftNode = [SCNNode nodeWithGeometry:[self drawWallSide]];
    wallLeftNode.position = SCNVector3Make(-1.5f,10.0,28.5f);
    [blocksNode addChildNode:wallLeftNode];
    
    
    for (int i =0; i<20; i++) {
        
        for (int j = 0; j<20; j++) {
            SCNNode *blockNode = [SCNNode nodeWithGeometry:[self block]];
            blockNode.position = SCNVector3Make(j*3,0,i*3);
            [blocksNode addChildNode:blockNode];
        }
        //int j = i* 3;
        
    }
    
    SCNNode *wallRightNode = [SCNNode nodeWithGeometry:[self drawWallSide]];
    wallRightNode.position = SCNVector3Make(60-1.5,10.0,28.5f);
    [blocksNode addChildNode:wallRightNode];
    return blocksNode;
}

@end
