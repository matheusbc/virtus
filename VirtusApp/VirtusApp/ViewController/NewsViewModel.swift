//
//  NewsViewModel.swift
//  VirtusApp
//
//  Created by Matheus Campos on 11/09/17.
//  Copyright © 2017 Matheus B Campos. All rights reserved.
//

import Foundation

class NewsViewModel {
    var newsList: [News] = []
    
    init() {
        // Mocked news. To get news from a server, comment the line below and get the news from the server.
        self.generateMockNews()
    }

    func getListSize() -> Int {
        return newsList.count
    }

    func description(cellForRowAt index: Int) -> String {
        return newsList[index].description
    }

    func imageUrl(cellForRowAt index: Int) -> String {
        return newsList[index].imageUrl
    }

    private func generateMockNews() {
        newsList = [
            News(description: "O Virtus realizou um curso interno de iOS com o intuito de capacitar seus profissionais para projetos futuros. O curso foi ministrado durante 5 semanas, com frequência de duas vezes por semana, nas dependências do Virtus, que possui iMac e mac mini.", imageUrl: "https://image.freepik.com/icones-gratis/noticia_318-103409.jpg"),
            News(description: "Em comemoração ao dia do programador será realizado um super GeekDay no dia 13 de Setembro. No evento, haverá pizza e refrigerante, além de um campeonato de Robocode. O vencedor do campeonato ganhará um Apple Watch.", imageUrl: "http://www.casageek.com.br/325-large_leocame/porta-livro-geek.jpg"),
            News(description: "O VIRTUS foi fundado por pesquisadores do CEEI com mais de 15 anos de experiência em projetos de pesquisa e desenvolvimento, com foco em geração de valor e diferencial competitivo para grandes empresas do setor industrial. Sua infraestrutura conta com mais de 1.000 metros quadrados de laboratórios com equipamentos de última geração, segurança da informação e diversas salas de vídeo conferência para garantir comunicação constante e irrestrita com clientes globais. Seu principal diferencial é a excelência operacional para a execução de projetos. A parceria com institutos privados, tais como o Instituto Venturus e o Instituto Nokia de Tecnologia respaldam a qualidade operacional, aliada à reconhecida competência técnica de seus pesquisadores e o suporte administrativo do Parque Tecnológico da Paraíba. Como parte do CEEI, os projetos desenvolvidos no VIRTUS poderão receber recursos da EMBRAPII, o que representa mais um diferencial para clientes em busca de competência técnica e inovação de produtos através do uso de recursos financeiros não reembolsáveis.“Foram investidos R$ 3,5 milhões para a obtenção destas instalações, com recursos oriundos da parceria com a iniciativa privada. O VIRTUS  já inicia a sua operação com uma carteira de projetos contratados acima de R$ 18 milhões e será responsável pela fixação de mais de 200 profissionais, entre graduados, mestres e doutores”, disse a diretora geral da Fundação PaqTcPB, Francilene Procópio Garcia.", imageUrl: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAk-AAAAJDU5ZDQzYWE1LWYzYjgtNDRkYy04YmRiLTAxZGMxZWM5Y2FiNw.jpg")
        ]
    }
}
