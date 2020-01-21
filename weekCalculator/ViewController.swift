//
//  ViewController.swift
//  weekCalculator
//
//  Created by 高士傑 on 2019/12/23.
//  Copyright © 2019 高士傑. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    
    var mArry:[MoneyData] = []
    var firstIntArr:[Int] = []
    var secondIntArr:[Int] = []
    
    //Array 加總
    var countOne:Int = 0
    var countTwo:Int = 0
    var average:Int = 0
    var finalCalculate:Int = 0
    
    @IBAction func buttonPressedOne(_ sender: Any) {
    
        let moneyData = MoneyData(amountOne: textFieldOne.text ?? "", amountTwo: textFieldTwo.text ?? "")
        
        mArry.append(moneyData)
        
        calculate()
        
        tableView.reloadData()
    }
    
    @IBAction func buttonPressedTwo(_ sender: Any) {
        showAlertWith(title: "計算結果", message: "少的要給多的\(abs(finalCalculate))元\n記帳金額：\(average)")
    }
    
    @IBAction func clearResult(_ sender: Any) {
        let alert = UIAlertController(title: "確定要移除？", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "確定", style: .default) { (action) in
            self.mArry.removeAll()
            self.tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel)
        alert.addAction(action)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldOne.keyboardType = .numberPad
        textFieldTwo.keyboardType = .numberPad
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MyTableViewCell.nib, forCellReuseIdentifier: MyTableViewCell.identifier)
    }
    
    func calculate() {
        textFieldOne?.text = ""
        textFieldTwo?.text = ""
        
        var firstArr:[String] = []
        var secondArr:[String] = []
        
        //取出資料 Array 裡的 amountOne 並塞到 firstArr
        firstArr = mArry.compactMap({ (moneyData) -> String? in
            return moneyData.amountOne
        })
        secondArr = mArry.compactMap({ (moneyData) -> String? in
            return moneyData.amountTwo
        })
        
        //將 StringArray 轉成 IntArray
        firstIntArr = firstArr.map {(Int($0) ?? 0)}
        secondIntArr = secondArr.map {(Int($0) ?? 0)}
        
        //計算
        countOne = firstIntArr.reduce(0, +)
        countTwo = secondIntArr.reduce(0, +)
        average = (countOne + countTwo) / 2
        finalCalculate = average - countOne
    }
    
    func showAlertWith(title: String, message: String) {
        //視窗標題、內容
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        //視窗按鈕
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        //顯示視窗
        present(alert, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        cell.setData(moneyData: mArry[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Left Amount / Right Amount"
    }
}

extension ViewController: UITextFieldDelegate {
    
}

