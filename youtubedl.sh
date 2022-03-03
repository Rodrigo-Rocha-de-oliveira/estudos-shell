
#!/usr/bin/env bash

#--------------------------------------------------------------------------------
# Autor: Rodrigo Rocha
# Versão: 0.0.1 
# E-mail: contatorodrigorochadeoliveira@gmail.com
# Manutenção: Rodrigo Rocha <contatorodrigorochadeoliveira@gmail.com>
#--------------------------------------------------------------------------------
# Este programa recebe como parametro o link do endereço do video do youtube.
# E procura o de melhor qualidade e fazendo o download do mesmo.
# Este programa por hora só faz um download por link por vez.
# O Downaloda será feito na mesma pasta de onde o baixar_video.sh foi executado.
#--------------------------------------------------------------------------------
# Este script foi projeto para iniciantes em shell script, estudar-lo
#--------------------------------------------------------------------------------
# Licença: GPL
#--------------------------------------------------------------------------------
# Criação de Variáveis
#--------------------------------------------------------------------------------

azul="\033[34;1m" # Produz uma saída de cor azul.
fim="\033[m"      # Fim da cor azul.

# "vi" variavel da qual irá receber o link do vídeo, deixei assim para não ter uma var vazia  

#--------------------------------------------------------------------------------

# Cor vermelha caso de erro.
vermelho="\033[31;1m" # Produz uma saída de cor vermelha.

# Testando se o youtube está no ar
# para isso usarei o comando ping com a opção -c3 pinga no máximo 3 vezes.
# Se  não houver conexão ele avisará o ususrio.

if ping -c3 youtube.com &>/dev/null; then              # &>/dev/null ser para evitar enche a tela com mensagens do ping
	echo -e "${azul} O youtube esta no ar espere... ${fim}"  # Caso o youtube esta no ar essa mensgem será enviada ao usuraio
	sleep 3s
else
	echo -e "${vermelho} O youtube esta fora do ar ${end}"	# Caso contrario essa mensagem será enviada ao usuario
	sleep 3s
	exit 1
fi	

# Perdindo ao usuario qual é o link do vídeo do youtube ele quer baixar.

echo -e "${azul}Entre com o link do vídeo para Donwload, Curso na linha de baixo --> ${fim}"
read "vi"

# Entrando com o youtube-dl propriamente dito.

youtube-dl   -f best  "${vi}" # -f e best forçam para uma melhor qualidade.

[[ "$?" -eq 0 ]] && { echo -e "${azul}O vídeo Baixado com Sucesso! ${fim}"; sleep 2s; echo "" ;  } ||  { echo -e "${vermelho}Erro ao Baixar o Vídeo ${fim}"; sleep 3s; exit 1; }

# mostrando o arquivo baixado:
for i in * ;do echo "----> $i"; done 

