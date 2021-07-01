//
//  ViewController.swift
//  Propina
//

import UIKit

class ViewController: UIViewController {
    
    var persona = 1
    var porcentaje = 10
    var calculo: Float = 0.0
    
    @IBOutlet weak var cantidadTextField: UITextField!
    @IBOutlet weak var porcentajeSlider: UISlider!
    @IBOutlet weak var cantidadPorcentajeLabel: UILabel!
    @IBOutlet weak var personasSlider: UISlider!
    @IBOutlet weak var cantidadPersonaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        porcentajeSlider.value = Float(porcentaje)
        personasSlider.value = Float(persona)
        updateLabelPerson()
        updateLabelPerson()
    }
    
    // Actualizar label de porcentaje
    func updateLabelPorcentaje(){
        self.porcentaje = Int (self.porcentajeSlider.value)
        self.cantidadPorcentajeLabel.text = "\(self.porcentaje) %"
    }
    
    // Actualizar label de personas
    func updateLabelPerson(){
        self.persona = Int (self.personasSlider.value)
        self.cantidadPersonaLabel.text = "\(self.persona)"
    }
    
    // Hacer dinamico el cambio de % de propina a traves del slider
    @IBAction func sliderPorcentajeMove(_ sender: UISlider) {
        self.updateLabelPorcentaje()
    }
    
    // Hacer dinamico el cambio de # de personas a traves del slider
    @IBAction func sliderPersonMove(_ sender: UISlider) {
        self.updateLabelPerson()
    }
    
    @IBAction func calcularButton(_ sender: UIButton) {
        guard let cantidad = cantidadTextField.text else { return }
        if cantidad != "" {
            let porcentajeCantidad = Float(((Float(cantidad)! * Float(porcentaje)) / 100.00))
            self.calculo = Float(porcentajeCantidad / Float(persona))
        } else {
            let alert = UIAlertController(title: "Error", message: "Debe ingresar una cantidad.", preferredStyle: .alert)
            let actionAcept = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
            alert.addAction(actionAcept)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueResultado") {
            let vc = segue.destination as! ResultadoViewController
            vc.cantidad = calculo
        }
    }
}
