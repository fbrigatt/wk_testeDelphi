/*
Navicat MySQL Data Transfer

Source Server         : pcrw
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : wk

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2021-03-17 13:07:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `clientes`
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id_cli` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('1', 'Amanda Almeida Costa', 'Caçapava', 'SP');
INSERT INTO `clientes` VALUES ('2', 'Manuela Cunha Castro', 'Itajubá', 'MG');
INSERT INTO `clientes` VALUES ('3', 'Miguel Barros Sousa', 'São Paulo', 'SP');
INSERT INTO `clientes` VALUES ('4', 'Kauan Rocha Correia', 'Brasília', 'DF');
INSERT INTO `clientes` VALUES ('5', 'Lara Barbosa Ribeiro', 'Rio de Janeiro', 'RJ');
INSERT INTO `clientes` VALUES ('6', 'Vitória Martins Costa', 'Itapeva', 'SP');
INSERT INTO `clientes` VALUES ('7', 'Luis Castro Souza', 'Jataí', 'GO');
INSERT INTO `clientes` VALUES ('8', 'Thaís Gomes Dias', 'Belo Horizonte', 'MG');
INSERT INTO `clientes` VALUES ('9', 'Marina Almeida Silva', 'Goiânia', 'GO');
INSERT INTO `clientes` VALUES ('10', 'Lucas Melo Fernandes', 'Feira de Santana', 'BA');
INSERT INTO `clientes` VALUES ('11', 'Carolina Almeida Melo', 'Candeias', 'BA');
INSERT INTO `clientes` VALUES ('12', 'Enzo Dias Azevedo', 'Alagoinhas', 'BA');
INSERT INTO `clientes` VALUES ('13', 'Sarah Ribeiro Pereira', 'Itatiba', 'SP');
INSERT INTO `clientes` VALUES ('14', 'Gabrielly Pinto Araujo', 'São Paulo', 'SP');
INSERT INTO `clientes` VALUES ('15', 'Mateus Barros Silva', 'Porto Velho', 'RO');
INSERT INTO `clientes` VALUES ('16', 'Yasmin Almeida Araujo', 'Feira de Santana', 'BA');
INSERT INTO `clientes` VALUES ('17', 'Rafaela Araujo Carvalho', 'Salvador', 'BA');
INSERT INTO `clientes` VALUES ('18', 'Luís Rocha Cardoso', 'Varginha', 'MG');
INSERT INTO `clientes` VALUES ('19', 'Renan Azevedo Santos', 'Camaçarí', 'BA');
INSERT INTO `clientes` VALUES ('20', 'Gustavo Almeida Fernandes', 'São Paulo', 'SP');

-- ----------------------------
-- Table structure for `pedidos_dados_gerais`
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_dados_gerais`;
CREATE TABLE `pedidos_dados_gerais` (
  `num_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `data_emissao` datetime NOT NULL,
  `valor_total` double NOT NULL,
  `clientes_id` int(11) NOT NULL,
  PRIMARY KEY (`num_pedido`),
  KEY `fk_pedidos_dados_gerais_clientes_idx` (`clientes_id`),
  CONSTRAINT `fk_pedidos_dados_gerais_clientes` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id_cli`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pedidos_dados_gerais
-- ----------------------------

-- ----------------------------
-- Table structure for `pedidos_produtos`
-- ----------------------------
DROP TABLE IF EXISTS `pedidos_produtos`;
CREATE TABLE `pedidos_produtos` (
  `item` int(11) NOT NULL AUTO_INCREMENT,
  `qtde` int(11) NOT NULL,
  `vlr_unit` double NOT NULL,
  `vlr_total` double NOT NULL,
  `num_pedido` int(11) NOT NULL,
  `produtos_id_prod` int(11) NOT NULL,
  PRIMARY KEY (`item`),
  KEY `fk_pedidos_produtos_pedidos_dados_gerais1_idx` (`num_pedido`),
  KEY `fk_pedidos_produtos_produtos1_idx` (`produtos_id_prod`),
  CONSTRAINT `fk_pedidos_produtos_pedidos_dados_gerais1` FOREIGN KEY (`num_pedido`) REFERENCES `pedidos_dados_gerais` (`num_pedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_produtos_produtos1` FOREIGN KEY (`produtos_id_prod`) REFERENCES `produtos` (`id_prod`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pedidos_produtos
-- ----------------------------

-- ----------------------------
-- Table structure for `produtos`
-- ----------------------------
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `id_prod` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `preco_venda` double NOT NULL,
  PRIMARY KEY (`id_prod`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of produtos
-- ----------------------------
INSERT INTO `produtos` VALUES ('1', 'Monitor AOC 16', '200');
INSERT INTO `produtos` VALUES ('2', 'Monitor Dell 19', '450');
INSERT INTO `produtos` VALUES ('3', 'Monitor LG 17', '230');
INSERT INTO `produtos` VALUES ('4', 'Cabo Hdmi 1.80 Metros Novo', '49.9');
INSERT INTO `produtos` VALUES ('5', 'Case Externa Ydtech P/hd Sata 2.5 Usb 3.0', '55');
INSERT INTO `produtos` VALUES ('6', 'Fone de Ouvido Intra Auricular Com Microfone', '10.9');
INSERT INTO `produtos` VALUES ('7', 'Adaptador Usb 4 Portas Hub Extensor Usb', '35');
INSERT INTO `produtos` VALUES ('8', 'Notebook Dell 5480', '1900');
INSERT INTO `produtos` VALUES ('9', 'Notebook DELL E6400', '750');
INSERT INTO `produtos` VALUES ('10', 'Notebook Acer ES', '1000');
INSERT INTO `produtos` VALUES ('11', 'Notebook Asus', '1300');
INSERT INTO `produtos` VALUES ('12', 'Notebook Lenovo R61', '800');
INSERT INTO `produtos` VALUES ('13', 'Pc Gamer – Processador Intel Core I5 3ª G', '3360');
INSERT INTO `produtos` VALUES ('14', 'Pc Gamer – Processador Intel Core I7 3ª G', '5500');
INSERT INTO `produtos` VALUES ('15', 'Computador Completo- Intel Core 2 Duo', '1000');
INSERT INTO `produtos` VALUES ('16', 'Computador Completo- Amd Athlon Dual Core', '1000');
INSERT INTO `produtos` VALUES ('17', 'Adaptador Antena Wifi Usb', '45');
INSERT INTO `produtos` VALUES ('18', 'Adaptador Wireless Receptor Antena Wifi USB', '45');
INSERT INTO `produtos` VALUES ('19', 'Pen drive Samsung 2TB', '180');
INSERT INTO `produtos` VALUES ('20', 'Pen Drive 8gb Minions', '80');
