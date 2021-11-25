//
//  OnboardingViewController.swift
//  natureza
//
//  Created by Geovanna Kasemirinski da Silva on 22/11/21.
//


import UIKit
import SnapKit
import AVFoundation
import SwiftUI




class OnboardingViewController: UIViewController {
    var count = 0
    
    
    
    
    lazy var viewVideo: UIView = {
        
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .appGray4
        view.layer.opacity = 20
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var circleProceses: UIView = {
        
        let circle = UIView()
        circle.backgroundColor = .blue
        circle.layer.cornerRadius =  circle.frame.size.width/2
        circle.clipsToBounds = true
        
        return circle
    }()
    
    lazy var titleLabel: UILabel = {
        
        let title = UILabel()
        title.text = "Faça uma pausa na rotina"
        title.font = .systemFont(ofSize: 34, weight: .bold)
        title.textColor = .appLabelLight
        title.textAlignment = .left
        title.numberOfLines = 0
        return title
    }()
    
    
    lazy var subLabel: UILabel = {
        
        let subtitle = UILabel()
        subtitle.text = "O dia a dia pode ser estressante e sentimos falta dos momentos de lazer, dos momentos relaxantes de contato com a natureza. Utilize o Natour em sua rotina, faça pequenas pausas e se conecte com a natureza disponível ao seu redor!"
        subtitle.font = .systemFont(ofSize: 15, weight: .regular)
        subtitle.textColor = .appLabelLight
        subtitle.textAlignment = .left
        subtitle.numberOfLines = 0
        return subtitle
    }()
    
    
    @objc lazy var nextButton: UIButton = {
       
        let button = UIButton()
        button.setTitleColor(.appGray4, for: .normal)
        button.setTitle("Próximo", for: .normal)
        button.layer.cornerRadius = 18
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .tintColor
        button.layer.masksToBounds =  true
        button.addTarget(self, action: #selector(nextButtonIndex), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = true
        
        

        
        return button
    }()
    
 
    
    @objc func nextButtonIndex(){
    
        count += 1
        
      if count == 1 {
            titleLabel.text = "Acompanhe as mudanças"
            subLabel.text = "Provavelmente você já percebeu as mudanças que acontecem na natureza durante as estações do ano. Uma árvore que derruba suas folhas, a posição do sol e o florear das plantas. Registre esses momentos e compare-os!"
            
            
        }else if count == 2 {
            titleLabel.text = "Registre o crescimento"
            subLabel.text = "Você observa o desenvolvimento das plantas ao seu redor? Gostaria de registrar e acompanhar as mudanças da natureza ao longo do ano? Configure o calendário de registros que te lembraremos."
            
            
        }else if count == 3 {
            titleLabel.text = "Tenha coleções da natureza"
            subLabel.text = "A natureza está em todos os lugares. No caminho para o trabalho, nos parques da sua cidade, nas plantas que decoram ambientes ou até mesmo no pôr-do-sol que se altera durante o ano. Crie uma coleção para cada um desses contatos durante a sua rotina."
            
            
        }else if count == 4 {
            titleLabel.text = "Crie edições incríveis"
            subLabel.text = "Escolha uma de suas coleções e crie vídeos com os registros feitos durante um período de tempo. Com a sequência de registros é possível gerar vídeos incríveis, revelando as etapas e suas mudanças em um lapso de tempo."
            
            
        }else if count == 5 {
            titleLabel.text = "Compartilhe com o mundo"
            subLabel.text = "Fazemos parte da natureza e precisamos de momentos de contemplação e conexão com ela para recarregar nossas energias. Utilize o Natour não só para incluir e registrar esses momentos, mas também para compartilhar os resultados com o mundo!"
            nextButton.removeTarget(self, action: #selector(nextButtonIndex), for: .touchUpInside)
            nextButton.addTarget(self, action: #selector(continueClick), for: .touchUpInside)
            nextButton.setTitle("Continuar", for: .normal)
        }
      
    }
    
    @objc func continueClick() {
        navigationController?.pushViewController(TabBarViewController(), animated: true)
    }
        
//    func playVideo(){
//        guard let path = Bundle.main.path(forResource: "onboarding", ofType: "quicktime") else { return
//        }
//
//        let player = AVPlayer(url: URL(fileURLWithPath: path))
//        let playLayer = AVPlayerLayer(player: player)
//        playLayer.frame = self.view.bounds
//        playLayer.videoGravity = .resizeAspectFill
//        self.viewVideo.layer.addSublayer(playLayer)
//
//        player.play()
//    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //playVideo()
        setupViewVideo()
        setupTitleLabel()
        setupSubLabel()
        setupNextButton()
        setupCircleProcess()
       
    }
    
    
    
    
    private func setupViewVideo(){
        
        view.addSubview(viewVideo)
        viewVideo.snp.makeConstraints { make in
            
            make.height.equalTo(420)
            make.bottom.equalTo(0)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)

        }
    }
    
    private func setupTitleLabel(){
        
        viewVideo.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            
            make.left.equalTo(20)
            make.right.equalTo(-90)
            make.top.equalTo(26)
        }
    }

    
    private func setupSubLabel(){
        
        viewVideo.addSubview(subLabel)
        subLabel.snp.makeConstraints { make in
            
            make.left.equalTo(20)
            make.right.equalTo(-28)
            make.top.equalTo(130)
        }
    }

    private func setupNextButton(){
        
        viewVideo.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            
            make.left.equalTo(240)
            make.right.equalTo(-20)
            make.top.equalTo(302)
            make.bottom.equalTo(-80)
            make.width.equalTo(133)
        }
    }
    
    private func setupCircleProcess(){
        
        viewVideo.addSubview(circleProceses)
        circleProceses.snp.makeConstraints { make in
            
            make.left.equalTo(20)
            make.right.equalTo(-330)
            make.top.equalTo(322)
            make.bottom.equalTo(-77)
            make.width.equalTo(8)
            make.height.equalTo(8)
        }
    }
    
    
    
    
    
}




    
   
    

