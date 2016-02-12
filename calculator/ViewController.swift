//
//  ViewController.swift
//  calculator
//
//  Created by student on 2016-02-05.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //constraints
    var result = "0"
    var negPos = ""
    var firstNum = 0.0
    var secondNum = 0.0
    var total = 0.0
    var isFirst = true
    var mathType = -1
    var reset = false
    
    
    //constants
    let ADD = 0
    let SUB = 1
    let MUL = 2
    let DIV = 3
    
    let formatter = NSNumberFormatter()
    
    
    @IBOutlet weak var resultLabel: UILabel!

    
    //protected methods
    
    func updateLabel(){
        resultLabel.text = negPos + result
    }
    
    func stringToNum(){
        
        if(isFirst){
            firstNum = (result as NSString).doubleValue
            
            if(negPos == "-"){
                firstNum *= -1
                negPos = ""
                
                
            }
            isFirst = false
            result = "0"
            updateLabel()
        }
        else{
            secondNum = (result as NSString).doubleValue
            
            if(negPos == "-"){
                secondNum *= -1
                negPos = ""
                
            }
            isFirst = true
        }
        
    }
    
    
    //button methods

    @IBAction func ACButton(sender: UIButton) {
        result = "0"
        firstNum = 0
        secondNum = 0
        isFirst = true
        negPos = ""
        updateLabel()
    }
    
    @IBAction func PosNegButton(sender: UIButton){
        
        if (negPos == "" && result != "0" ){
            negPos = "-"
            
        }
        else{
            negPos = ""
        }
        updateLabel()
    }
    
    @IBAction func PercentButton(sender: UIButton){
        if(!isFirst && firstNum != 0){
            stringToNum()
            secondNum /= 100
            secondNum *= firstNum
            result = String(secondNum)
            updateLabel()
        }
    }
    
    @IBAction func DivideButton(sender: UIButton) {
        if(isFirst){
            stringToNum()
        }
        mathType = DIV
    }
    @IBAction func PlusButton(sender: UIButton) {
        if(isFirst){
            stringToNum()
        }
        mathType = ADD
    }
    @IBAction func MultiplyButton(sender: UIButton){
        if(isFirst){
            stringToNum()
        }
        mathType = MUL
    }
    @IBAction func MinusButton(sender: UIButton) {
        if(isFirst){
            stringToNum()
        }
        mathType = SUB
    }
    @IBAction func OneButton(sender: UIButton) {
        if(result == "0"){
            result = "1"
        }
        else{
            result += "1"
        }
        updateLabel()
    }
    
    @IBAction func TwoButton(sender: UIButton) {
        if(result == "0"){
            result = "2"
        }
        else{
            result += "2"
        }
        updateLabel()
    }
    
    @IBAction func ThreeButton(sender: UIButton) {
        if(result == "0"){
            result = "3"
        }
        else{
            result += "3"
        }
        updateLabel()
    }
    
    @IBAction func FourButton(sender: UIButton) {
        if(result == "0"){
            result = "4"
        }
        else{
            result += "4"
        }
        updateLabel()
    }
    
    @IBAction func FiveButton(sender: UIButton) {
        if(result == "0"){
            result = "5"
        }
        else{
            result += "5"
        }
        updateLabel()
    }
    
    @IBAction func SixButton(sender: UIButton) {
        if(result == "0"){
            result = "6"
        }
        else{
            result += "6"
        }
        updateLabel()
    }

    @IBAction func SevenButton(sender: UIButton) {
        if(result == "0"){
            result = "7"
        }
        else{
            result += "7"
        }
        updateLabel()
    }
    
    @IBAction func EightButton(sender: UIButton) {
        if(result == "0"){
            result = "8"
        }
        else{
            result += "8"
        }
        updateLabel()
    }
    
    @IBAction func NineButton(sender: UIButton) {
        if(result == "0"){
            result = "9"
        }
        else{
            result += "9"
        }
        updateLabel()
    }
    
    
    @IBAction func ZeroButton(sender: UIButton) {
        if(result != "0"){
            result += "0"
            updateLabel()
        }
      
        
    }
    
    @IBAction func DecimalButton(sender: UIButton) {
        if(result.rangeOfString(".")==nil){
            result += "."
            updateLabel()
        }
      
        
    }
    
    
    @IBAction func EqualsButton(sender: UIButton) {
        if(!isFirst){
            
            stringToNum()
            var error = false
            
            switch(mathType)
            {
            case ADD: total = firstNum + secondNum
                break
            case SUB: total = firstNum - secondNum
                break
            case MUL: total = firstNum * secondNum
                break
            case DIV:
            if(secondNum != 0){
            total = firstNum / secondNum
            }
            else{
            var error = true
            }
            break
            default : break
            }
            if(!error){
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 5
            
            result = formatter.stringFromNumber(total)!
            
            }
            else{
            result = "error"
            
            }
            
            updateLabel()
        }
        
    }
    
    
    
    
}

