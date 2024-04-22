//
//  TabMoreCollectionView.swift
//  TabBottomPop
//
//  Created by 张亚飞 on 2024/4/20.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SnapKit

class TabMoreCollectionView: UIView{
    
    //数据源
    var actionItems:[MenuItem] = []
    
    private var disposeBag = DisposeBag()
    let frame_width = UIScreen.main.bounds.width
    
    lazy var bottomView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.clipsToBounds =  true
        return v
    }()
    
    lazy var tipsLbl : UILabel = {
        let v = UILabel()
        v.text = "工具箱"
        v.textColor = .gray
        v.font = UIFont.systemFont(ofSize: 14)
        return v
    }()
    
    lazy var collectionView: UICollectionView = {
        let v = UICollectionView()
        v.register(itemCell.self, forCellWithReuseIdentifier: "itemCell")
        v.dataSource = self
        v.delegate = self
        return v;
    }()
    
    
    lazy var lineView: UIView = {
        let v = UIView()
        v.backgroundColor = .black;
        v.layer.cornerRadius = 2
        return v;
    }()
    
    lazy var bottomLineView: UIView = {
        let v = UIView()
        v.backgroundColor = .gray.withAlphaComponent(0.2);
        return v;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        backgroundColor = .gray.withAlphaComponent(0.05)
        
        
        addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.snp.bottom)
            make.height.equalTo(0)
        }
        bottomView.layer.cornerRadius = 10
        bottomView.layer.maskedCorners  = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        bottomView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.height.equalTo(5)
            make.top.equalToSuperview().offset(18)
            make.centerX.equalToSuperview()
        }
        
        bottomView.addSubview(tipsLbl)
        tipsLbl.snp.makeConstraints { make in
            make.centerY.equalTo(lineView)
            make.trailing.equalTo(-20)
        }
        
        
        
        bottomView.addSubview(bottomLineView)
        bottomLineView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }

        
        bottomView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.leading.bottom.trailing.equalToSuperview()
            
        }
        
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    public struct MenuItem {
        let title: String
        let icon: UIImage?
        let action: () -> Void
        public init(title: String, icon: UIImage?, action: @escaping () -> Void) {
            self.title = title
            self.icon = icon
            self.action = action
        }
    }
    
    
    
    
    class itemCell: UICollectionViewCell {
        
        private var itemData:MenuItem = MenuItem(title: "标题", icon: nil) {
            
        }
        
        let iconImageView: UIImageView = {
            let v = UIImageView()
            v.backgroundColor = UIColor.red
            return v
        }()

        let titleLabel: UILabel = {
            let v = UILabel()
            v.font = .systemFont(ofSize: 14)
            v.textColor = .gray
            return v
        }()
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            contentView.addSubview(iconImageView)
            contentView.addSubview(titleLabel)
            
            backgroundColor = .green
            
            iconImageView.snp.makeConstraints { make in
                make.top.equalTo(10)
                make.width.height.equalTo(50)
                make.centerX.equalToSuperview()
            }
            
            titleLabel.snp.makeConstraints { make in
                make.top.equalTo(iconImageView.snp.bottom).offset(5)
                make.centerX.equalToSuperview()
            }
        }
        
        
        
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    
}

extension TabMoreCollectionView : UICollectionViewDataSource, UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        actionItems.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! itemCell
        
        return cell
    }
    
    
}
