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
    
    SCNNode *carbonCarbonBondNode1 = [self carbonBond];
    carbonCarbonBondNode1.position = SCNVector3Make(+2, 0, 0);
    carbonCarbonBondNode1.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [methaneMolecule addChildNode:carbonCarbonBondNode1];
    
    SCNNode *carbonCarbonBondNode2 = [self carbonBond];
    carbonCarbonBondNode2.position = SCNVector3Make(-2, 0, 0);
    carbonCarbonBondNode2.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [methaneMolecule addChildNode:carbonCarbonBondNode2];
    
    
    SCNNode *carbonCarbonBondNode3 = [self carbonBond];
    carbonCarbonBondNode3.position = SCNVector3Make(0, 2, 0);
    //  carbonCarbonBondNode3.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [methaneMolecule addChildNode:carbonCarbonBondNode3];
    
    SCNNode *carbonCarbonBondNode4 = [self carbonBond];
    carbonCarbonBondNode4.position = SCNVector3Make(0, -2, 0);
    //  carbonCarbonBondNode4.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [methaneMolecule addChildNode:carbonCarbonBondNode4];
    
    
    return methaneMolecule;
}

+(SCNNode *) ethanolMolecule{
    SCNNode *ethanolMolecule = [[SCNNode alloc] init];
    
    //2 carbon
    [self nodeWithAtom:[Atoms carbonAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(0, 0, 0)];
    [self nodeWithAtom:[Atoms carbonAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(-4, 0, 0)];
    
    //connect 2 carbon atoms with scncylinder
    
    SCNNode *carbonCarbonBondNode1 = [self carbonBond];
    carbonCarbonBondNode1.position = SCNVector3Make(-2, 0, 0);
    carbonCarbonBondNode1.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ethanolMolecule addChildNode:carbonCarbonBondNode1];
    
    SCNNode *carbonCarbonBondNode2 = [self carbonBond];
    carbonCarbonBondNode2.position = SCNVector3Make(-6, 0, 0);
    carbonCarbonBondNode2.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ethanolMolecule addChildNode:carbonCarbonBondNode2];
    
    
    SCNNode *carbonCarbonBondNode3 = [self carbonBond];
    carbonCarbonBondNode3.position = SCNVector3Make(-4, 2, 0);
  //  carbonCarbonBondNode3.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ethanolMolecule addChildNode:carbonCarbonBondNode3];
    
    SCNNode *carbonCarbonBondNode4 = [self carbonBond];
    carbonCarbonBondNode4.position = SCNVector3Make(-4, -2, 0);
  //  carbonCarbonBondNode4.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ethanolMolecule addChildNode:carbonCarbonBondNode4];
    
    //1 oxygen connected with first carbon
    [self nodeWithAtom:[Atoms oxygenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(+4, 0, 0)];
    
    SCNNode *carbonCarbonBondNode5 = [self carbonBond];
    carbonCarbonBondNode5.position = SCNVector3Make(+2, 0, 0);
    carbonCarbonBondNode5.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ethanolMolecule addChildNode:carbonCarbonBondNode5];
    
    SCNNode *carbonCarbonBondNode6 = [self carbonBond];
    carbonCarbonBondNode6.position = SCNVector3Make(0, 2, 0);
    //  carbonCarbonBondNode3.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ethanolMolecule addChildNode:carbonCarbonBondNode6];
    
    SCNNode *carbonCarbonBondNode7 = [self carbonBond];
    carbonCarbonBondNode7.position = SCNVector3Make(0, -2, 0);
    //  carbonCarbonBondNode4.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ethanolMolecule addChildNode:carbonCarbonBondNode7];
    
    SCNNode *carbonCarbonBondNode8 = [self carbonBond];
    carbonCarbonBondNode8.position = SCNVector3Make(+6, 0, 0);
    carbonCarbonBondNode8.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ethanolMolecule addChildNode:carbonCarbonBondNode8];
    
    //
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(-8, 0, 0)];
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(-4, +4, 0)];
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(-4, -4, 0)];
    
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(0, +4, 0)];
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(0, -4, 0)];
    
    [self nodeWithAtom:[Atoms hydrogenAtoms] molecule:ethanolMolecule andPosition:SCNVector3Make(+8, 0, 0)];
    
    return ethanolMolecule;
}

+(SCNNode *) carbonBond{
    SCNCylinder *bondCylinder = [SCNCylinder cylinderWithRadius:0.2 height:4];
    bondCylinder.firstMaterial.diffuse.contents = [UIColor darkGrayColor];
    bondCylinder.firstMaterial.specular.contents = [UIColor whiteColor];
    SCNNode *carbonCarbonBondNode = [SCNNode nodeWithGeometry:bondCylinder];
 //   carbonCarbonBondNode.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    return carbonCarbonBondNode;
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
    
    SCNNode *carbonCarbonBondNode1 = [self carbonBond];
    carbonCarbonBondNode1.position = SCNVector3Make(+2, 0, 0);
    carbonCarbonBondNode1.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ptfeMolecule addChildNode:carbonCarbonBondNode1];
    
    SCNNode *carbonCarbonBondNode2 = [self carbonBond];
    carbonCarbonBondNode2.position = SCNVector3Make(-2, 0, 0);
    carbonCarbonBondNode2.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ptfeMolecule addChildNode:carbonCarbonBondNode2];
    
    
    SCNNode *carbonCarbonBondNode3 = [self carbonBond];
    carbonCarbonBondNode3.position = SCNVector3Make(0, 2, 0);
    //  carbonCarbonBondNode3.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ptfeMolecule addChildNode:carbonCarbonBondNode3];
    
    SCNNode *carbonCarbonBondNode4 = [self carbonBond];
    carbonCarbonBondNode4.position = SCNVector3Make(0, -2, 0);
    //  carbonCarbonBondNode4.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ptfeMolecule addChildNode:carbonCarbonBondNode4];
    
    
    SCNNode *carbonCarbonBondNode5 = [self carbonBond];
    carbonCarbonBondNode5.position = SCNVector3Make(-4, 2, 0);
    //  carbonCarbonBondNode3.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ptfeMolecule addChildNode:carbonCarbonBondNode5];
    
    SCNNode *carbonCarbonBondNode6 = [self carbonBond];
    carbonCarbonBondNode6.position = SCNVector3Make(-4, -2, 0);
    //  carbonCarbonBondNode4.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ptfeMolecule addChildNode:carbonCarbonBondNode6];
    
    SCNNode *carbonCarbonBondNode7 = [self carbonBond];
    carbonCarbonBondNode7.position = SCNVector3Make(-6, 0, 0);
    carbonCarbonBondNode7.rotation = SCNVector4Make(0, 0, 1, M_PI/2);
    [ptfeMolecule addChildNode:carbonCarbonBondNode7];
    
    return ptfeMolecule;
}


+(SCNNode *) nodeWithAtom:(SCNGeometry*) atom molecule:(SCNNode*)molecule andPosition:(SCNVector3)position{
    SCNNode *node = [SCNNode nodeWithGeometry:atom];
    node.position = position;
    [molecule addChildNode:node];
    return node;
}

@end
