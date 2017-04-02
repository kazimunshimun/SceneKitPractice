//
//  Blocks.m
//  BlockTutorial
//
//  Created by Anik on 3/31/17.
//  Copyright © 2017 A7Studio. All rights reserved.
//

#import "Blocks.h"

#define TILE_WIDTH  3.0
#define TILE_HEIGHT 0.2
#define TILE_LENGTH 3.0

#define WALL_HEIGHT 20.2
#define WALL_LENGTH 0.2

#define NUM_OF_TILE_VERTICAL    20
#define NUM_OF_TILE_HORIZONTAL  20

@implementation Blocks

+(SCNGeometry *) block{
    
    SCNBox *boxGeometry = [SCNBox boxWithWidth:TILE_WIDTH height:TILE_HEIGHT length:TILE_LENGTH chamferRadius:0.01f];
    boxGeometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"tiles1"];
    boxGeometry.firstMaterial.specular.contents = [UIColor whiteColor];
    
    return boxGeometry;
}

+(SCNGeometry *) drawWall{
    
    SCNBox *boxGeometry = [SCNBox boxWithWidth:NUM_OF_TILE_VERTICAL*TILE_WIDTH height:WALL_HEIGHT length:WALL_LENGTH chamferRadius:0.0f];
    boxGeometry.firstMaterial.diffuse.contents = [UIColor lightGrayColor];
    boxGeometry.firstMaterial.specular.contents = [UIColor whiteColor];
    
    return boxGeometry;
}

+(SCNGeometry *) drawWallSide{
    
    SCNBox *boxGeometry = [SCNBox boxWithWidth:WALL_LENGTH height:WALL_HEIGHT length:NUM_OF_TILE_VERTICAL*TILE_WIDTH chamferRadius:0.0f];
    boxGeometry.firstMaterial.diffuse.contents = [UIColor lightGrayColor];
    boxGeometry.firstMaterial.specular.contents = [UIColor whiteColor];
    
    return boxGeometry;
}

+(SCNNode *) backWall{
    SCNNode *wallBackNode = [SCNNode nodeWithGeometry:[self drawWall]];
    CGFloat wallPositionX = (NUM_OF_TILE_VERTICAL*TILE_WIDTH)/2.0 - TILE_WIDTH/2.0;
    CGFloat wallPositionY = WALL_HEIGHT/2.0;
    CGFloat wallPositionZ = TILE_LENGTH/2.0;
    wallBackNode.position = SCNVector3Make(wallPositionX,wallPositionY,-wallPositionZ);
    return wallBackNode;
}

+(SCNNode *) allBlocks{
    SCNNode *blocksNode = [[SCNNode alloc] init];
    
    [blocksNode addChildNode:[self backWall]];
    
    SCNNode *wallLeftNode = [SCNNode nodeWithGeometry:[self drawWallSide]];
    wallLeftNode.position = SCNVector3Make(-1.5f,10.0,28.5f);
    [blocksNode addChildNode:wallLeftNode];
    
    
    for (int i =0; i<NUM_OF_TILE_VERTICAL; i++) {
        for (int j = 0; j<NUM_OF_TILE_HORIZONTAL; j++) {
            SCNNode *blockNode = [SCNNode nodeWithGeometry:[self block]];
            blockNode.position = SCNVector3Make(j*TILE_WIDTH, 0, i*TILE_LENGTH);
            [blocksNode addChildNode:blockNode];
        }
    }
    
    SCNNode *wallRightNode = [SCNNode nodeWithGeometry:[self drawWallSide]];
    wallRightNode.position = SCNVector3Make(60-1.5,10.0,28.5f);
    [blocksNode addChildNode:wallRightNode];
    return blocksNode;
}

@end
