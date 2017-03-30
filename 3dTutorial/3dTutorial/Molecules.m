//
//  Molecules.m
//  3dTutorial
//
//  Created by Anik on 3/28/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

#import "Molecules.h"
#import "Atoms.h"


@implementation Molecules


+(SCNNode *) methaneMolecule{
    SCNNode *methaneMolecule = [[SCNNode alloc] init];
    
    [self nodeWithAtom:[Atoms carbonAtoms] molecule:methaneMolecule andPosition:SCNVector3Make(0, 0, 0)];
    
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:methaneMolecule andPosition:SCNVector3Make(-4, 0, 0)];
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:methaneMolecule andPosition:SCNVector3Make(+4, 0, 0)];
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:methaneMolecule andPosition:SCNVector3Make(0, -4, 0)];
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:methaneMolecule andPosition:SCNVector3Make(0, +4, 0)];
    
    
    return methaneMolecule;
}

+(SCNNode *) ethanolMolecule{
    SCNNode *ethanolMolecule = [[SCNNode alloc] init];
    
    //2 carbon
    [self nodeWithAtom:[Atoms carbonAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(0, 0, 0)];
    [self nodeWithAtom:[Atoms carbonAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(-4, 0, 0)];
    
    //connect 2 carbon atoms with scncylinder
    //SCNCylinder *carbonCarbonBond = [SCNCylinder cylinderWithRadius:.5 height:2];
    
    //[ethanolMolecule addChildNode:carbonCarbonBond];
    
    //1 oxygen connected with first carbon
    [self nodeWithAtom:[Atoms oxygenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(+4, 0, 0)];
    
    //
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(-8, 0, 0)];
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(-4, +4, 0)];
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(-4, -4, 0)];
    
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(0, +4, 0)];
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(0, -4, 0)];
    
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(+8, 0, 0)];
    
    return ethanolMolecule;
}

+(SCNNode *) ptfeMolecule{
    SCNNode *ptfeMolecule = [[SCNNode alloc] init];
    
    //2 carbon
    [self nodeWithAtom:[Atoms carbonAtoms] molecule:ptfeMolecule andPosition:SCNVector3Make(0, 0, 0)];
    [self nodeWithAtom:[Atoms carbonAtoms] molecule:ptfeMolecule andPosition:SCNVector3Make(-4, 0, 0)];
    
    //2 flurine connected to first carbon
    [self nodeWithAtom:[Atoms flurineAtoms] molecule:ptfeMolecule andPosition:SCNVector3Make(0, +4, 0)];
    [self nodeWithAtom:[Atoms flurineAtoms] molecule:ptfeMolecule andPosition:SCNVector3Make(0, -4, 0)];
    
    //2 flurine connected to second carbon
    [self nodeWithAtom:[Atoms flurineAtoms] molecule:ptfeMolecule andPosition:SCNVector3Make(-4, +4, 0)];
    [self nodeWithAtom:[Atoms flurineAtoms] molecule:ptfeMolecule andPosition:SCNVector3Make(-4, -4, 0)];
    
    return ptfeMolecule;
}


+(SCNNode *) nodeWithAtom:(SCNGeometry*) atom molecule:(SCNNode*)molecule andPosition:(SCNVector3)position{
    SCNNode *node = [SCNNode nodeWithGeometry:atom];
    node.position = position;
    [molecule addChildNode:node];
    return node;
}

@end
