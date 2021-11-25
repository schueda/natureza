//
//  OnboardingContentVieww.swift
//  natureza
//
//  Created by Geovanna Kasemirinski da Silva on 23/11/21.
//

import UIKit

class OnboardingContentView: UIViewController {

    lazy var nextButton: UIButton = {
       
        let button = UIButton()
        button.setTitleColor(.appGray4, for: .normal)
        button.setTitle("Próximo", for: .normal)
        button.layer.cornerRadius = 24
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .tintColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        
        let title = UILabel()
        title.text = ""
        title.font = .systemFont(ofSize: 34, weight: .bold)
        title.tintColor = .appLabelLight
        title.textAlignment = .left
        return title
    }()
    
    
    lazy var subLabel: UILabel = {
        
        let subtitle = UILabel()
        subtitle.text = ""
        subtitle.font = .systemFont(ofSize: 15, weight: .regular)
        subtitle.tintColor = .appLabelLight
        subtitle.textAlignment = .left
        return subtitle
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
    }
    
    
    private func nextButtonIndex(){
        
        var countButton = 0
        
        if countButton == 1 {
            titleLabel.text = "Faça uma pausa na rotina"
            subLabel.text = "O dia a dia pode ser estressante e sentimos falta dos momentos de lazer, dos momentos relaxantes de contato com a natureza. Utilize o [nome do app] em sua rotina, faça pequenas pausas e se conecte com a natureza disponível ao seu redor!"
            
            countButton += 1
        }else if countButton == 2 {
            titleLabel.text = "Acompanhe as mudanças"
            subLabel.text = "Provavelmente você já percebeu as mudanças que acontecem na natureza durante as estações do ano. Uma árvore que derruba suas folhas, a posição do sol e o florear das plantas. Registre esses momentos e compare-os!"
            
            countButton += 1
        }else if countButton == 3 {
            titleLabel.text = "Registre o crescimento"
            subLabel.text = "Você observa o desenvolvimento das plantas ao seu redor? Gostaria de registrar e acompanhar as mudanças da natureza ao longo do ano? Configure o calendário de registros que te lembraremos."
            
            countButton += 1
        }else if countButton == 4 {
            titleLabel.text = "Tenha coleções da natureza"
            subLabel.text = "A natureza está em todos os lugares. No caminho para o trabalho, nos parques da sua cidade, nas plantas que decoram ambientes ou até mesmo no pôr-do-sol que se altera durante o ano. Crie uma coleção para cada um desses contatos durante a sua rotina."
            
            countButton += 1
        }else if countButton == 5 {
            titleLabel.text = "Crie edições incríveis"
            subLabel.text = "Escolha uma de suas coleções e crie vídeos com os registros feitos durante um período de tempo. Com a sequência de registros é possível gerar vídeos incríveis, revelando as etapas e suas mudanças em um lapso de tempo."
            
            countButton += 1
        }else if countButton == 6 {
            titleLabel.text = "Compartilhe com o mundo"
            subLabel.text = "Fazemos parte da natureza e precisamos de momentos de contemplação e conexão com ela para recarregar nossas energias. Utilize o [nome do app] não só para incluir e registrar esses momentos, mas também para compartilhar os resultados com o mundo!"
            
        }
        
    }

    private func setupTitle(){
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(28)
            make.bottom.equalTo(-314)
        }
    }
    
    
    
}
