import UIKit
import PlaygroundSupport

class NView: UIView {
    let height: CGFloat = 50.0
    let interSpace: CGFloat = 20.0
    
    let topView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let middleView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.addSubview(topView)
        self.addSubview(middleView)
        self.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            topView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: interSpace),
            topView.topAnchor.constraint(equalTo: self.topAnchor, constant: interSpace),
            topView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -interSpace),
            topView.heightAnchor.constraint(equalToConstant: height),
            
            middleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: interSpace),
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: interSpace),
            middleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -interSpace),
            middleView.heightAnchor.constraint(equalToConstant: height),
            
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: interSpace),
            bottomView.topAnchor.constraint(equalTo: middleView.bottomAnchor, constant: interSpace),
            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -interSpace),
            bottomView.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}

class MView: UIView {
    
    let topView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let middleView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let containerStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.spacing = 20
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(frame: CGRect, orientation: NSLayoutConstraint.Axis = .horizontal) {
        super.init(frame: frame)
        containerStackView.axis = orientation
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // here we will use UIStackView
        setupUI()
    }
    
    func setupUI() {
        self.addSubview(containerStackView)
        containerStackView.addArrangedSubview(topView)
        containerStackView.addArrangedSubview(middleView)
        containerStackView.addArrangedSubview(bottomView)
        
        NSLayoutConstraint.activate([
            containerStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            containerStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            topView.heightAnchor.constraint(equalToConstant: 120),
            topView.widthAnchor.constraint(equalToConstant: 120),
            
            middleView.heightAnchor.constraint(equalToConstant: 80),
            middleView.widthAnchor.constraint(equalToConstant: 200),
            
            bottomView.heightAnchor.constraint(equalToConstant: 200),
            bottomView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}

var greeting = "Hello, playground"
var newView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
newView.backgroundColor = .red


let greenView = UIView(frame: newView.frame)
greenView.backgroundColor = .green

newView = greenView

let nView = NView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

let mView = MView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))

let mView2 = MView(frame: CGRect(x: 0, y: 0, width: 300, height: 300), orientation: .vertical)

