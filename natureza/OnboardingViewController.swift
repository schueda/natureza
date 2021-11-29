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
    
    var player: AVPlayer?
    var playLayer: AVPlayerLayer?
    var media = ["Natour-Onboarding-Parte1", "Natour-Onboarding-Parte2", "Natour-Onboarding-Parte3", "Natour-Onboarding-Parte1", "Natour-Onboarding-Parte2", "Natour-Onboarding-Parte1"]
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 6
        pageControl.pageIndicatorTintColor = .appGray3
        pageControl.addTarget(self, action: #selector(getter: nextButton), for: .valueChanged)
        
        return pageControl
    }()
    
    
    lazy var viewBackground: UIView = {
        
        let view = UIView()
        view.clipsToBounds = true
        
        return view
    }()
    
    
    lazy var viewGray: UIView = {
        
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = UIColor.appGray4.withAlphaComponent(0.95)
        view.layer.opacity = 85
        view.layer.cornerRadius = 20
            
        return view
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
        
        switch(pageControl.currentPage){
            
        case 0:
            titleLabel.text = "Acompanhe as mudanças"
            subLabel.text = "Provavelmente você já percebeu as mudanças que acontecem na natureza durante as estações do ano. Uma árvore que derruba suas folhas, a posição do sol e o florear das plantas. Registre esses momentos e compare-os!"
        case 1:
            titleLabel.text = "Registre o crescimento"
            subLabel.text = "Você observa o desenvolvimento das plantas ao seu redor? Gostaria de registrar e acompanhar as mudanças da natureza ao longo do ano? Configure o calendário de registros que te lembraremos."
        case 2:
            titleLabel.text = "Tenha coleções da natureza"
            subLabel.text = "A natureza está em todos os lugares. No caminho para o trabalho, nos parques da sua cidade, nas plantas que decoram ambientes ou até mesmo no pôr-do-sol que se altera durante o ano. Crie uma coleção para cada um desses contatos durante a sua rotina."
        case 3:
            titleLabel.text = "Crie edições incríveis"
            subLabel.text = "Escolha uma de suas coleções e crie vídeos com os registros feitos durante um período de tempo. Com a sequência de registros é possível gerar vídeos incríveis, revelando as etapas e suas mudanças em um lapso de tempo."
        case 4:
            titleLabel.text = "Compartilhe com o mundo"
            subLabel.text = "Fazemos parte da natureza e precisamos de momentos de contemplação e conexão com ela para recarregar nossas energias. Utilize o Natour não só para incluir e registrar esses momentos, mas também para compartilhar os resultados com o mundo!"
            nextButton.removeTarget(self, action: #selector(nextButtonIndex), for: .touchUpInside)
            nextButton.addTarget(self, action: #selector(continueClick), for: .touchUpInside)
            nextButton.setTitle("Continuar", for: .normal)
        default:
            titleLabel.text = "Faça uma pausa na rotina"
            subLabel.text = "O dia a dia pode ser estressante e sentimos falta dos momentos de lazer, dos momentos relaxantes de contato com a natureza. Utilize o Natour em sua rotina, faça pequenas pausas e se conecte com a natureza disponível ao seu redor!"
        }
        if pageControl.currentPage < 5 {
            pageControl.currentPage += 1
            playVideo(index: pageControl.currentPage)
        }
    }
    
    
    
    @objc func continueClick() {
        navigationController?.pushViewController(TabBarViewController(), animated: true)
    }
    
    @objc func playerEndedPlaying(_ notification: Notification) {
        
        DispatchQueue.main.async {[weak self] in
            guard let me = self else { return }
            
            me.player?.seek(to: CMTime.zero)
            me.player?.play()
        }
    }
    
    
    func playVideo(index: Int){
        
        guard let path = Bundle.main.path(forResource: media[index], ofType: "mp4") else { return
        }
        
        player?.pause()
        player = AVPlayer(url: URL(fileURLWithPath: path))
        playLayer?.removeFromSuperlayer()
        playLayer = AVPlayerLayer(player: player)
        playLayer?.frame = self.view.bounds
        playLayer?.videoGravity = .resizeAspectFill
        self.viewBackground.layer.insertSublayer(playLayer!, at: 0)
        
        player?.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewBackground()
        playVideo(index: 0)
        setupViewGray()
        setupTitleLabel()
        setupSubLabel()
        setupNextButton()
        setupPageControl()
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerEndedPlaying), name: Notification.Name("AVPlayerItemDidPlayToEndTimeNotification"), object: nil)
        
    }
    
    
    private func setupViewBackground(){
        view.addSubview(viewBackground)
        viewBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupPageControl(){
        viewGray.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.left.equalTo(-20)
            make.top.equalTo(310)
        }
    }
    
    private func setupViewGray(){
        viewBackground.addSubview(viewGray)
        viewGray.snp.makeConstraints { make in
            make.height.equalTo(420)
            make.bottom.equalTo(0)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
    }
    
    private func setupTitleLabel(){
        viewGray.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-90)
            make.top.equalTo(26)
        }
    }
    
    private func setupSubLabel(){
        viewGray.addSubview(subLabel)
        subLabel.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-28)
            make.top.equalTo(130)
        }
    }
    
    private func setupNextButton(){
        viewGray.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.left.equalTo(240)
            make.right.equalTo(-20)
            make.top.equalTo(302)
            make.bottom.equalTo(-80)
            make.width.equalTo(133)
        }
    }
    
    
}








