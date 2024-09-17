import UIKit
import SnapKit

class LogoView: UIView {
    private lazy var logoImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "flight")
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 20)
        view.textColor = .black
        view.textAlignment = .center
        view.text = "TRAVEL MEMORY"
        return view
    }()
    
    private lazy var sloganLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 15)
        view.textColor = .black
        view.textAlignment = .center
        view.text = "JOURNAL"
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(logoImage)
        addSubview(nameLabel)
        addSubview(sloganLabel)
    }
    
    private func layout() {
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(65)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        sloganLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
