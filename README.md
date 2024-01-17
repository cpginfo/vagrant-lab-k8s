# Cluster Kubernetes com Vagrant e Virtualbox

Usado para estudos.

Roda em Windows, linux e mac.

## Instalar o virtualbox
https://www.virtualbox.org/wiki/Downloads

## Instalar o Vagrant
https://developer.hashicorp.com/vagrant/install?product_intent=vagrant

**Após a instalação é recomendado o reboot antes de continuar.

## Faça o download ou clone o repositorio
1. Acesse a pasta vagrant-lab-k8s   
- **IMPORTANTE:** Editar o arquivo: **Vagrantfile**

   Alterar a variavel **INTERFACE** para o nome da sua interface
```
$INTERFACE="Intel(R) I211 Gigabit Network Connection" #Nome da interface de rede local

```
- Definições das Vms que serão criadas ( **Atenção: Alterar os ips, para adequar a sua rede**)
```
hosts = {
  "master" => {"memory" => "2048", "cpu" => "2", "ip" => "192.168.0.50", "image" => "ubuntu/focal64" },
  "node1" => {"memory" => "1024", "cpu" => "1", "ip" => "192.168.0.51", "image" => "ubuntu/focal64" },
  "node2" => {"memory" => "1024", "cpu" => "1", "ip" => "192.168.0.52", "image" => "ubuntu/focal64" }
}
```
Serão criadas 3 Vms com as seguintes configurações:

- Master: Ubuntu 20.04, 2gb, 2CPU (Recomendacao para node master do k8s)
- Node1: Ubuntu 20.04, 1gb, 1CPU
- Node2: Ubuntu 20.04, 1gb, 1CPU
  
Todas as Vms estaram na rede local, modo bridge, sendo acessivel pela rede.

### Iniciando o vagrant
```
vagrant up
```
![Vagrant2](https://github.com/cpginfo/vagrant-lab-k8s/assets/39770143/bfdd4874-fed3-41b4-bfcd-b2a90be4c3d5)

Aguarde finalizar o processo

## VirtualBox após o vagrant finalizar
![Virtual Box](https://github.com/cpginfo/vagrant-lab-k8s/assets/39770143/c9b21e42-0d14-48cb-8bbd-05b725aa9c44)

### Verificando o Cluster
```
vagrant ssh master
kubectl get nodes
```
![Vagrant](https://github.com/cpginfo/vagrant-lab-k8s/assets/39770143/af8a01d4-a69f-4236-8423-26eef3eae534)

### Remover tudo
```
vagrant destroy
```
![image](https://github.com/cpginfo/vagrant-lab-k8s/assets/39770143/dcfddf67-925c-402c-8cf8-1e3677ef3b3c)


# Referências

- [Vagrant Documentation](https://developer.hashicorp.com/vagrant/docs)
- [Kubernets Documentation](https://kubernetes.io/pt-br/docs/home/)
