# SpotAnalyzer

Skin Cancer Detector | Detector de Câncer de pele | Flutter | Keras | TensorFlow | Flask | 

Código de um app de detecção de cancer de pele usando IA/Visão Computacional. O Aplicativo foi feito através do Flutter, onde todo o código pode ser encontrado no diretório `FlutterApp/lib`. O modelo capaz de realizar as prediçoẽs foi hospedado em um servidor na AWS. E para a comunição entre o servidor e app, foi usando o framework Flask para receber e enviar as requisiçoẽs que pode ser encontrado na pasta `Flask`.

O modelo é capaz de indentificar 7 tipos diferentes de manchas ou "pintas".


1 - Carcinoma espinocelular,
2 - Carcinoma basocelular,
3 - Queratoses actínicas/seborreicas,
4 - Dermatofibroma,
5 - Melanoma,
6 - Nevos melanocítico,
7 - Lesões vasculares de pele

O modelo criado com Python|Keras|TensorFlow pode ser feito o download aqui, assim como os pesos treinados com uma precisão de 86% na classificação. 

Não é uma acurácia muito alta, porém consegue dar forte indícios. 

O app está disponível para Android, porém ainda não está na Google Play, então caso queira testar basta somente baixar `release.apk` e instalar no seu aparelho.
