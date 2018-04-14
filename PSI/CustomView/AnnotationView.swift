import MapKit

class AnnotationView: MKAnnotationView {
    
    let lblTitle:UILabel = UILabel.init(frame:CGRect(x: 5, y: 3, width: 40, height: 20))
    let lblSubtitle:UILabel = UILabel.init(frame:CGRect(x: 5, y: 20, width: 40, height: 20))
    let divider:UIView = UIView(frame: CGRect(x: 5, y: 20+2, width: 40, height: 1))
    
    func showDivider(){
        divider.backgroundColor = .gray
        self.addSubview(divider)
    }
    
    func showTitle(title : String)
    {
        lblTitle.text = title
        lblTitle.textAlignment = .center
        lblSubtitle.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(lblTitle)
    }
    
    func showSubtitle(title : String)
    {
        lblSubtitle.text = title
        lblSubtitle.textAlignment = .center
        lblSubtitle.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(lblSubtitle)
    }
}
