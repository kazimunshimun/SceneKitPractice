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

#define NUM_OF_TILE_VERTICAL    15
#define NUM_OF_TILE_HORIZONTAL  10

@interface Blocks(){
    SCNBox *boxGeometry;
    SCNNode *blocksNode;
}

@end

@implementation Blocks

-(SCNGeometry *) block{
    
    boxGeometry = [SCNBox boxWithWidth:TILE_WIDTH height:TILE_HEIGHT length:TILE_LENGTH chamferRadius:0.01f];
    boxGeometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"tiles1"];
    boxGeometry.firstMaterial.specular.contents = [UIColor whiteColor];
    
    return boxGeometry;
}

-(void) setTileImage{
    
    for (int i = 0; i < NUM_OF_TILE_VERTICAL; i++) {
        for (int j = 0; j < NUM_OF_TILE_HORIZONTAL; j++) {
            NSString* nodeName = [NSString stringWithFormat:@"%dn%d",i,j];
            SCNNode* blockNode = [blocksNode childNodeWithName:nodeName recursively:NO];
            SCNGeometry* blockGeometry = blockNode.geometry;
            blockGeometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"tile4"];
        }
    }
 //   boxGeometry.firstMaterial.diffuse.contents = [UIImage imageNamed:@"tile4"];
}

-(SCNGeometry *) drawWall{
    
    SCNBox *wallGeometry = [SCNBox boxWithWidth:NUM_OF_TILE_HORIZONTAL*TILE_WIDTH height:WALL_HEIGHT length:WALL_LENGTH chamferRadius:0.0f];
    wallGeometry.firstMaterial.diffuse.contents = [UIColor lightGrayColor];
    wallGeometry.firstMaterial.specular.contents = [UIColor whiteColor];
    
    return wallGeometry;
}

-(SCNGeometry *) drawWallSide{
    
    SCNBox *wallGeometry = [SCNBox boxWithWidth:WALL_LENGTH height:WALL_HEIGHT length:NUM_OF_TILE_VERTICAL*TILE_WIDTH chamferRadius:0.0f];
    wallGeometry.firstMaterial.diffuse.contents = [UIColor lightGrayColor];
    wallGeometry.firstMaterial.specular.contents = [UIColor whiteColor];
    
    return wallGeometry;
}

-(void) backWall{
    SCNNode *wallBackNode = [SCNNode nodeWithGeometry:[self drawWall]];
    CGFloat wallPositionX = (NUM_OF_TILE_HORIZONTAL*TILE_WIDTH)/2.0 - TILE_WIDTH/2.0;
    CGFloat wallPositionY = WALL_HEIGHT/2.0;
    CGFloat wallPositionZ = TILE_LENGTH/2.0;
    wallBackNode.position = SCNVector3Make(wallPositionX,wallPositionY,-wallPositionZ);
    [blocksNode addChildNode:wallBackNode];
}

-(void) leftWall{
    CGFloat wallLeftPositionX = TILE_WIDTH/2.0;
    CGFloat wallLeftPositionY = WALL_HEIGHT/2.0;
    CGFloat wallLeftPositionZ = (NUM_OF_TILE_VERTICAL*TILE_LENGTH)/2.0 - TILE_LENGTH/2.0;
    
    SCNNode *wallLeftNode = [SCNNode nodeWithGeometry:[self drawWallSide]];
    wallLeftNode.position = SCNVector3Make(-wallLeftPositionX,wallLeftPositionY,wallLeftPositionZ);
    [blocksNode addChildNode:wallLeftNode];
}

-(void) rightWall{
    
    CGFloat wallRightPositionX = (NUM_OF_TILE_HORIZONTAL*TILE_WIDTH) - TILE_WIDTH/2.0;
    CGFloat wallRightPositionY = WALL_HEIGHT/2.0;
    CGFloat wallRightPositionZ = (NUM_OF_TILE_VERTICAL*TILE_LENGTH)/2.0 - TILE_LENGTH/2.0;
    
    SCNNode *wallRightNode = [SCNNode nodeWithGeometry:[self drawWallSide]];
    wallRightNode.position = SCNVector3Make(wallRightPositionX, wallRightPositionY, wallRightPositionZ);
    [blocksNode addChildNode:wallRightNode];
}

-(SCNNode *) allBlocks{
    blocksNode = [[SCNNode alloc] init];
    
    [self backWall];
    [self leftWall];
    [self rightWall];
    
    for (int i =0; i<NUM_OF_TILE_VERTICAL; i++) {
        for (int j = 0; j<NUM_OF_TILE_HORIZONTAL; j++) {
            SCNNode *blockNode = [SCNNode nodeWithGeometry:[self block]];
            blockNode.position = SCNVector3Make(j*TILE_WIDTH, 0, i*TILE_LENGTH);
            blockNode.name = [NSString stringWithFormat:@"%dn%d",i,j];
         //   NSLog(@"%@",blockNode.name);
            [blocksNode addChildNode:blockNode];
        }
    }
    
    
    return blocksNode;
}

@end
