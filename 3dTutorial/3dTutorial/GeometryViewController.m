//
//  GeometryViewController.m
//  3dTutorial
//
//  Created by Anik on 3/28/17.
//  Copyright © 2017 mTeam. All rights reserved.
//

#import "GeometryViewController.h"
#import "Atoms.h"
#import "Molecules.h"

@interface GeometryViewController (){
    SCNNode *geometryNode;
    float currentAngle;
}
@property (weak, nonatomic) IBOutlet SCNView *geometrySceneView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation GeometryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    geometryNode = [[SCNNode alloc] init];
    currentAngle = 0.0f;
    [self sceneSetup];
}

-(void) sceneSetup{
    SCNScene *scene = [[SCNScene alloc] init];
  //  SCNBox *boxGeometry = [SCNBox boxWithWidth:10.0f height:10.0f length:10.0f chamferRadius:1.0f];
  //  SCNNode *boxNode = [SCNNode nodeWithGeometry:boxGeometry];
  //  [scene.rootNode addChildNode:boxNode];
    
    geometryNode = [Atoms allNodes];
    [scene.rootNode addChildNode:geometryNode];
    
   // geometryNode = boxNode;
    UIPanGestureRecognizer *pangesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
    [self.geometrySceneView addGestureRecognizer:pangesture];
    
    SCNNode *ambientLightNode = [[SCNNode alloc] init];
    ambientLightNode.light = [[SCNLight alloc] init];
    ambientLightNode.light.type = SCNLightTypeOmni;
    ambientLightNode.light.color = [UIColor colorWithWhite:0.75f alpha:1.0f];
    ambientLightNode.position = SCNVector3Make(0, 50, 50);
    [scene.rootNode addChildNode:ambientLightNode];
    
    self.geometrySceneView.scene = scene;
 //   self.geometrySceneView.autoenablesDefaultLighting = YES;
 //   self.geometrySceneView.allowsCameraControl = YES;
    
}

-(void) panGestureRecognizer :(UIPanGestureRecognizer*) gesture{
    CGPoint translation = [gesture translationInView:gesture.view];
    float newAngle = translation.x * (float)(M_PI)/180;
    newAngle += currentAngle;
    geometryNode.transform = SCNMatrix4MakeRotation(newAngle, 0, 1, 0);
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        currentAngle = newAngle;
    }
    
    
}
- (IBAction)segmentedControlValueChanged:(id)sender {
    
    // 1
    [geometryNode removeFromParentNode];
    currentAngle = 0.0;
    
    switch ([sender selectedSegmentIndex]) {
        case 0:
        {
            self.titleLabel.text = @"Atoms";
            geometryNode = [Atoms allNodes];
            break;
        }
        case 1:
        {
            self.titleLabel.text = @"Methane (Natural Gas)";
            geometryNode = [Molecules methaneMolecule];
            break;
        }
            
        case 2:
        {
            self.titleLabel.text = @"Ethanol (Alcohol)";
            geometryNode = [Molecules ethanolMolecule];
            break;
        }
        case 3:
        {
            self.titleLabel.text = @"Polytetrafluoroethylene (Teflon)";
            geometryNode = [Molecules ptfeMolecule];
            break;
        }
        default:
            break;
    }
    
    [self.geometrySceneView.scene.rootNode addChildNode:geometryNode];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
