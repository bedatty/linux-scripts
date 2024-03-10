#!/usr/bin/env bash

exibir_erro() {
    echo "Erro: $1" >&2
    exit 1
}

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common || exibir_erro "Falha ao atualizar ou instalar dependências."
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null || exibir_erro "Falha ao obter a chave de assinatura."
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list || exibir_erro "Falha ao adicionar o repositório do HashiCorp."
sudo apt update && sudo apt install terraform -y || exibir_erro "Falha ao atualizar ou instalar o Terraform."

echo -e "\n\nTerraform instalado com sucesso!"