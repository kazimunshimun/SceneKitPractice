//
//  Atoms.h
//  3dTutorial
//
//  Created by Anik on 3/28/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SceneKit/SceneKit.h>

@interface Atoms : NSObject

+(SCNNode *) allNodes;
+(SCNGeometry *) carbonAtoms;
+(SCNGeometry *) hydrogenAtoms;
+(SCNGeometry *) oxygenAtoms;
+(SCNGeometry *) flurineAtoms;
@end
