//
//  PostModelView.swift
//  arcSagacia
//
//  Created by Gustavo Dias on 22/02/23.
//

import SwiftUI
import PhotosUI
import CoreImage
import Firebase
import FirebaseFirestoreSwift

@MainActor class HomeModelView: ObservableObject {
    @Published var selectedImages = [UIImage]()
    @Published var images = [UIImage]()
    @Published var imageIsValid = false
    @Published var imageClass = ""
    @Published var imageDescription = ""
    @Published var isLoading = false
    
    let arcDescriptions = [
        
                        "O Barroco foi o estilo artístico dominante no Brasil durante a maior parte do período colonial, encontrando um terreno receptivo para um rico florescimento. Fez sua aparição no país no início do século XVII, introduzido por missionários católicos, especialmente jesuítas, que para lá se dirigiram a fim de catequizar e aculturar os povos indígenas nativos e auxiliar os portugueses no processo colonizador. Ao longo do período colonial vigorou uma íntima associação entre a Igreja e o Estado, mas como na colônia não havia uma corte que servisse de mecenas, como as elites não se preocuparam em construir palácios ou patrocinar as artes profanas senão no fim do período, e como a religião exercia enorme influência no cotidiano de todos, deste conjunto de fatores deriva que a vasta maioria do legado barroco brasileiro esteja na arte sacra: estatuária, pintura e obra de talha para decoração de igrejas e conventos ou para culto privado.",
                           
                           "Dada a precariedade de fontes sobre as culturas indígenas brasileiras, há grande dificuldade em relatar cada uma das comunidades. No entanto, entre todo o território, elas possuíam entre si mais semelhanças do que diferenças, como seu modo de viver, habitações, cultos religiosos, caça e sistemas construtivos. Não há classes sociais entre os indígenas; todos tem os mesmos deveres e direitos com tratamento igualitário. A arquitetura é feita de modo vernacular. O clima tropical, úmido, com temperaturas amenas fez com que não houvesse a necessidade de materiais mais elaborados. Antes da chegada europeia no território brasileiro, havia em torno de 5 milhões de nativos, estando divididos em comunidades ao longo da região brasileira. Contando com mais de 220 etnias, atualmente, o país soma mais de 454 mil índios.",
                           
                           "Sentindo a necessidade de uma renovação definitiva no panorama arquitetônico nacional, com vistas a uma homogeneização da paisagem urbana, em meados da década de 1920 se reuniu um grupo de profissionais em torno do russo Gregori Warchavchik, contratado pelo grupo Simonsen para trabalhar na cidade de São Paulo. Seu primeiro projeto foi a Casa Modernista. Este grupo de arquitetos colocou o Brasil entre os principais expoentes internacionais da indústria da construção civil. O grupo vinha inspirado pela arquitetura de Le Corbusier, Walter Gropius, Richard Neutra, Mies Van der Rohe e Frank Lloyd Wright, e se ligava a movimentos estéticos como o Futurismo e o Modernismo. Participaram deste período revolucionário, entre outros, Affonso Eduardo Reidy, Rino Levi, Carlos Leão, Ernâni Vasconcelos, Jorge Moreira, Lucio Costa, e acima de todos Oscar Niemeyer. A visita de Le Corbusier ao Brasil em 1929, e sua posterior contratação pelo governo brasileiro em 1936 para dar assessoria ao projeto do prédio do antigo Ministério da Educação e Saúde, no Rio, colocaram o Modernismo em evidência.[101][102] Corbusier, conforme análise de Luís Henrique Luccas, procurou adaptar os seus princípios universalistas e sintéticos à realidade nacional, recomendando o uso de referenciais da tradição colonial, como o uso de azulejaria decorada e ajardinamento do entorno com as tradicionais palmeiras imperiais. Isso de fato estava concorde com a tendência política nacionalista dominante, e o edifício do Ministério se tornou um protótipo do palácio público dos novos tempos, incluindo em sua concepção também outros elementos simbólicos tradicionais, como a decoração em escultura e pintura com temas patrióticos, num período em que o Brasil acenava para as direitas internacionais, o governo queria homogeneizar culturalmente a nação e fundava o Estado Novo. Para a obra, Portinari, espécie de pintor-oficial do governo naquela época, deixou sua tela famosa do Café, e Bruno Giorgi, seu grupo escultórico da Juventude brasileira.[96][102][103] O edifício foi louvado internacionalmente, sendo considerado uma das mais importantes criações modernistas das Américas.[103] Outros edifícios erguidos na época exerceram também grande impacto, favorecendo a aceitação do Modernismo, como os pavilhões do Brasil na Feira Mundial de Nova Iorque e o conjunto da Pampulha, em Belo Horizonte, que estabeleceu o nome de Niemeyer como o líder da nova geração.[103] Ao mesmo tempo, o debate teórico se multiplicava e adensava em fóruns e revistas especializadas,[104] e as cidades se verticalizavam aceleradamente, enchendo-se de concreto, com espigões populares de apartamentos cada vez menores, embora mais funcionais e mais bem aparelhados. Iniciava-se também, na crescente pressão por espaço de habitação nas grandes cidades, o fenômeno da especulação imobiliária e a subida explosiva do preço dos aluguéis.[105] O Modernismo na linha de Corbusier, pregando a arquitetura como uma síntese de todas as artes, incorporando elementos típicos locais, e centralizado na chamada Escola Carioca, logo veio a se tornar um estilo oficial do governo,[102] cujo coroamento foi a construção de Brasília na década de 1950, um projeto conjunto de Costa e Niemeyer de tamanha importância, influência e impacto que foi declarado Patrimônio Mundial pela UNESCO. O Modernismo trouxe avanços radicais à estética e à técnica de construção, onde predominam linhas geométricas simples e puras mas muitas vezes ousadas, e o concreto armado, o aço e o vidro assumem papel de destaque.[103][106]",
                           
                           "Elementos classicistas começam a ser notados novamente no Brasil a partir da atuação de arquitetos enviados pelo Marquês de Pombal para auxiliarem nas demarcações territoriais determinadas pelo Tratado de Madri de 1750, um grupo que incluía Antonio Landi, José Fernandes Alpoim e José Custódio de Sá e Faria. Outro arquiteto notável que adotou esquemas neoclássicos foi Mestre Valentim, atuando no Rio na virada para o século XIX. Inspirada no austero modelo do templo grego e influenciada pelo iluminismo, a arquitetura neoclássica buscava o equilíbrio e a economia, uma estética carregada de associações éticas e cívicas idealistas e progressistas, desejando expressar ordem, racionalidade e disciplina.[11][55] Contudo, somente após a chegada ao Rio da corte portuguesa em 1808, é que o estilo se tornou uma moda, reforçada pela presença da Missão Artística Francesa, um grupo de artistas e intelectuais franceses adeptos do Neoclassicismo que se transferiu para o Rio em 1816, propondo a renovação da prática e do ensino artístico nacional, onde se incluía a arquitetura. Por seu estímulo iniciaram as atividades da futura Academia Imperial de Belas Artes, que instaurou no país o método de ensino acadêmico, com prolífica descendência, e fixou definitivamente o Neoclassicismo como a estética mais prestigiada, contando com o patrocínio real.[56][57] A fórmula neoclássica mais erudita que vigorou no Brasil não fugiu muito do esquema do templo clássico, incorporando algumas liberdades da corrente palladiana e adaptando o modelo a fachadas de mais de um pavimento, predominando a demarcação de um pórtico central com frontão triangular sustentado por colunas, que às vezes se aplicavam a toda a extensão da fachada sob forma de pilastras, e mesmo em alguns casos adotando um esquema de peristilo. O arquiteto da Missão, Grandjean de Montigny, assumiu a cátedra de arquitetura civil, realizou várias obras para o governo, incluindo o prédio da Academia, e fez grande escola, tendo entre seus discípulos José Maria Jacinto Rebelo, Joaquim Cândido Guilhobel, José Domingos Monteiro e Francisco Joaquim Béthencourt da Silva, praticamente monopolizando os avanços na arquitetura local até sua morte em 1850. Entre suas inovações, Montigny introduziu novos parâmetros na concepção do espaço urbano, na ordenação das plantas, na criação de aberturas de ventilação e nos requisitos de higiene, que encontraram a resistência dos arquitetos e mestres-de-obra nativos, acostumados ao modelo barroco da edificação colonial.[55][58][59] Mesmo tendo a Missão Francesa uma função de divisor de águas na história da arquitetura brasileira, seria ingênuo supor que a herança anterior deixasse subitamente de influir na técnica e na estética das construções da primeira metade do século XIX, especialmente em locais afastados da corte carioca. Além disso, sua influência maior incidiu sobre os prédios oficiais, os grandes palacetes da elite, algumas faculdades, teatros e hospitais, tardando mais a habitação burguesa a acompanhar os desenvolvimentos arquitetônicos eruditos, ocorrendo muitas hibridizações e concessões à tradição colonial.[31][60]",
                           
                           "Uma tendência marcante e bem caracterizada, embora embutida na mesma perspectiva romântica-historicista que originou o Ecletismo, e em muitos casos transitando através de outros estilos em sínteses polimorfas, foi a moda neogótica que correu todo o Brasil entre o fim do século XIX e meados do século XX,[77] visível especialmente na arquitetura sacra, em vista do entendimento do Gótico histórico como um estilo espiritual,[78] mas encontrada em muitos tipos de edificação, incluindo residências, colégios, hospitais e presídios.[77] Embora fosse uma corrente revivalista, não impediu os arquitetos de experimentarem inovações nos materiais e na técnica construtiva. Por outro lado, o Neogótico frequentemente se manifestou apenas em detalhes e na decoração, e não nas estruturas essenciais, sendo facilmente distinguido pela presença de aberturas em arco ogival, típica do Gótico histórico, muitas vezes o único elemento que denuncia a referência historicista, misturada a outros elementos de estilos diferentes. Entre os primeiros exemplares a aparecer no território brasileiro estão o Real Gabinete Português de Leitura do Rio de Janeiro, os pavilhões da Ilha Fiscal e a Capela da Piedade, na mesma cidade, a Catedral de Petrópolis e o Santuário do Caraça. Embora o Neogótico internacional já tenha sido muito explorado pelos estudiosos, as pesquisas sobre esta corrente no Brasil ainda são escassas.[77] Podem ser indicados outros edifícios ilustrativos do Neogótico brasileiro, como a Catedral Metropolitana de São Paulo, um dos maiores templos neogóticos do mundo, adotando uma linha derivada da interpretação modernizada do Gótico nascida com Viollet-le-Duc, com uso de metal na cúpula e torres e técnicas avançadas de construção, a Igreja de Santa Teresinha, em Porto Alegre, inserida na chamada linha ideologica, que buscava uma aproximação literal do estilo medieval, com linhas puras e refinadas, a Catedral de Caxias do Sul, a Matriz de São Luiz Gonzaga e a Catedral de São João Batista de Santa Cruz do Sul."]
    
    func isImageValid() {
        let timestamp1 = NSDate().timeIntervalSince1970
        self.isLoading = true

        if(!images.isEmpty) {
            let imageToProcess = images[0] // Capture the image outside the closure
            DispatchQueue.global().async {  // Perform CPU-intensive work on background queue
                guard let ciImage = CIImage(image: imageToProcess) else { return }
                ArchitectureClassifierScript.detect(ciImage: ciImage, completion: { labelReceived in
                    DispatchQueue.main.async {  // Switch back to main queue to update UI
                        self.imageClass = labelReceived
                        self.imageDescription = self.getClassDescription()
                        self.imageIsValid = true
                        withAnimation {
                            self.isLoading = false
                        }
                        self.uploadSessionLogToFirebase(begginingTimestamp: timestamp1)
                    }
                })
            }
        } else {
            imageIsValid = false
        }
    }
    
    func getDeviceCode() -> String? {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
            }
        }
        return modelCode
    }
    
    func uploadSessionLogToFirebase(begginingTimestamp: TimeInterval) {
        let finishTimestamp = NSDate().timeIntervalSince1970
        
        let begginingTime = NSDate(timeIntervalSince1970: TimeInterval(begginingTimestamp))
        let finishTime = NSDate(timeIntervalSince1970: TimeInterval(finishTimestamp))
        
        let deviceId = UIDevice.current.identifierForVendor?.uuidString ?? ""
        let deviceModel = getDeviceCode() ?? ""
        let deviceSystem = UIDevice.current.systemVersion
        
        let sessionLog = SessionLog(deviceID: deviceId, deviceModel: deviceModel, systemVersion: deviceSystem, timeStarted: Timestamp(date: begginingTime as Date), timeFinished: Timestamp(date: finishTime as Date), secondsToRun: Float(finishTime.timeIntervalSince(begginingTime as Date)))
        
        guard let encodedSessionLog = try? Firestore.Encoder().encode(sessionLog) else {
            print("DEBUG: error getting firebase user")
            return
        }
        Firestore.firestore().collection("logs").document(sessionLog.id).setData(encodedSessionLog)
    }
    
    // ["Barroco", "Indígena", "Modernista", "Neoclassica", "Neogotico"]
    
    func getClassDescription() -> String {
        switch imageClass {
        case "Barroco":
            return arcDescriptions[0]
        case "Ecletica":
            return arcDescriptions[1]
        case "Modernista":
            return arcDescriptions[2]
        case "Neoclassico":
            return arcDescriptions[3]
        case "Neogotico":
            return arcDescriptions[4]
        default:
            return arcDescriptions[0]
        }
    }
}
