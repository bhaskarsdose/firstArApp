//
//  ViewController.swift
//  firstArApp
//
//  Created by pitARa on 27/04/21.
//

import UIKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var ARKitView: ARSCNView!
    @IBOutlet weak var pitARa: UILabel!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ARstart(_ sender: Any) {
        self.ARKitView.showsStatistics = true // this shows FPS on the bottom.
        self.ARKitView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,
                                       ARSCNDebugOptions.showWorldOrigin,
                                       ARSCNDebugOptions.showCreases]
        self.ARKitView.session.run(configuration)
        self.ARKitView.autoenablesDefaultLighting = true
    }
    
    @IBAction func add(_ sender: Any) {
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        node.geometry?.firstMaterial?.specular.contents = UIColor.red
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        node.position = SCNVector3(0,0,-0.3)
        self.ARKitView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func reset(_ sender: Any) {
        self.restartSession()
    }
    
    func restartSession() {
        self.ARKitView.session.pause()
        self.ARKitView.scene.rootNode.enumerateChildNodes
        { (node, _) in node.removeFromParentNode()
        }
        self.ARKitView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
}

