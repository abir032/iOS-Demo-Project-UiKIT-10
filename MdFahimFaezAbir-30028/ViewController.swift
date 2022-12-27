//
//  ViewController.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 8/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate  = self
        let nib1 = UINib(nibName: Constant.nibname1, bundle: nil)
        tableView.register(nib1, forHeaderFooterViewReuseIdentifier: Constant.nibname1)
        let nib2 = UINib(nibName: Constant.nibname2, bundle: nil)
        tableView.register(nib2, forHeaderFooterViewReuseIdentifier: Constant.nibname2)
        let footerNib = UINib(nibName: Constant.footerNib, bundle: nil)
        tableView.register(footerNib, forHeaderFooterViewReuseIdentifier: Constant.footerNib)
        
    }
   
    
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.firstCell, for: indexPath) as! MarvelTableViewCell
            cell.imgView.image = UIImage(named: MarvelSuperHero.marvelSuperHero[indexPath.row].image)
            cell.name.text = MarvelSuperHero.marvelSuperHero[indexPath.row].name
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.secCell, for: indexPath) as! DcTableViewCell
            cell.imgView.image = UIImage(named: DcSuperHero.dcSuperHero[indexPath.row].image)
            cell.name.text = DcSuperHero.dcSuperHero[indexPath.row].name
            return cell
        }
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return MarvelSuperHero.marvelSuperHero.count
        }else{
            return DcSuperHero.dcSuperHero.count
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let nibView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constant.nibname1)
            return nibView
        }else{
            let nibView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constant.nibname2)
            return nibView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0{
            let nibView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constant.footerNib) as! SuperHeroFooter
            nibView.labelView.text = "52 | © MARVEL COMICS. ALL RIGHTS RESERVED"
            return nibView
        }else{
            let nibView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constant.footerNib) as! SuperHeroFooter
            nibView.labelView.text = "52 | © DC COMICS. ALL RIGHTS RESERVED"
            return nibView
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        100
    }
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

