//
//  Atoms.m
//  3dTutorial
//
//  Created by Anik on 3/28/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

#import "Atoms.h"


@interface Atoms()



@end

@implementation Atoms

+(SCNGeometry *) carbonAtoms{
    SCNSphere* carbonAtom = [SCNSphere sphereWithRadius:1.70f];
    carbonAtom.firstMaterial.diffuse.contents = [UIColor darkGrayColor];
    carbonAtom.firstMaterial.specular.contents = [UIColor whiteColor];
    
    return carbonAtom;
}

+(SCNGeometry *) hydrogenAtoms{
    SCNSphere* hydrogenAtom = [SCNSphere sphereWithRadius:1.20f];
    hydrogenAtom.firstMaterial.diffuse.contents = [UIColor lightGrayColor];
    hydrogenAtom.firstMaterial.specular.contents = [UIColor whiteColor];
    
    return hydrogenAtom;
}

+(SCNGeometry *) oxygenAtoms{
    SCNSphere* oxygenAtom = [SCNSphere sphereWithRadius:1.52f];
    oxygenAtom.firstMaterial.diffuse.contents = [UIColor redColor];
    oxygenAtom.firstMaterial.specular.contents = [UIColor whiteColor];
    
    return oxygenAtom;
}

+(SCNGeometry *) flurineAtoms{
    SCNSphere* flurineAtom = [SCNSphere sphereWithRadius:1.47f];
    flurineAtom.firstMaterial.diffuse.contents = [UIColor yellowColor];
    flurineAtom.firstMaterial.specular.contents = [UIColor whiteColor];
    
    return flurineAtom;
}

+(SCNNode *) allNodes{
    SCNNode *atomsNode = [[SCNNode alloc] init];
    
    SCNNode *carbonNode = [SCNNode nodeWithGeometry:[self carbonAtoms]];
    carbonNode.position = SCNVector3Make(-6,0,0);
    [atomsNode addChildNode:carbonNode];
    
    SCNNode *hydrogenNode = [SCNNode nodeWithGeometry:[self hydrogenAtoms]];
    hydrogenNode.position = SCNVector3Make(-2,0,0);
    [atomsNode addChildNode:hydrogenNode];
    
    SCNNode *oxygenNode = [SCNNode nodeWithGeometry:[self oxygenAtoms]];
    oxygenNode.position = SCNVector3Make(+2,0,0);
    [atomsNode addChildNode:oxygenNode];
    
    SCNNode *flurineNode = [SCNNode nodeWithGeometry:[self flurineAtoms]];
    flurineNode.position = SCNVector3Make(+6,0,0);
    [atomsNode addChildNode:flurineNode];
    
    return atomsNode;
}

@end
