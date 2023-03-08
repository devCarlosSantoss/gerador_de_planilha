# language: pt
Funcionalidade: Validar BANCO - Pedido::558387 - Estimativa 558388:: Criação Vivo Turbo 15 dias
  
  #--------------------------------------- INFORMAÇÕES IMPORTANTES -----------------------------------#
  # OBJETIVO: Criação de nova VT de 15 dias para substituir a VT 861                                  #
  #                                                                                                   #
  # Lista de documentos:                                                                              #
  #  *Wiki - http://wiki.eisa.corp.com/pages/viewpage.action?pageId=140557654                         #
  #  *Documentos:																												                              #
  #     - NGINProCare_D564315_E564313_VivoTurboMensal_884_v20.2.0                                     #
  #     - PrePago_T86008_CFG563824_Servicos_884_20.2.0                                                #
  #     - PrePago_T86008_CFG563826_Servicos_VivoTurbo_SVA_v20.2.0                                     #
  #     - PrePago_T86008_CFG563828_Servicos_VivoTurboRefreshVTMensal_884_v20.2.0                      #
  #     - PrePago_T86009_CFG563830_Pacotes_884_20.2.1                                                 #
  #     - PrePago_T86009_CFG563832_Pacotes_VTComboChipBonusDobro_v20.2.0                              #
  #     - PrePago_T89515_CFG563835_TagsXProdutosOfertas_VivoTurbo_v20.1.0                             #
  #     - PrePago_T89753_CFG564235_PRP_MotivoFiscal_Nova_VT_15dias_20.2.0                             #
  #     - PrePago_T96745_CFG563837_Notificacoes_SMS_A8000_Alteracao_de_fraseologia_v20.2.0            #
  #     - PrePago_T190827_CFG563839_Regra_Custo_VivoTurbo_v20.2.0                                     #
  #     - PrePago_T258349_CFG564237_SimplicacaoExtratoDetalhado_n_20.2.0                              #
  #     - PrePago_T266545_CFG563841_Originador_Saldo_OfertasMensal_884_20.2.0                         #
  #     - PrePago_T270977_CFG563843_AgrupadorDeSaldo_OfertaMensal_884_20.2.0                          #
  #     - PrePago_T474595_CFG563845_StepsVivoTurbo_AlavancagemStepDown_20.2.0                         #
  #     - PrePago_T481996_CFG564282_CCA_Steps_VivoTurbo_AlavancagemStepDown_20.2.0                    #
  #     - PrePago_T505102_CFG563849_EficienciaTributaria_v20.2.0                                      #
  #                                                                                                   #
  # Test Designer: Matheus Gallo e Weverton Santos                         							              #
  #---------------------------------------------------------------------------------------------------#

  #------------------------------ OBJETIVO DO PEDIDO ---------------------------------------#
  # Público-Alvo: Pré                                                                       #
  #                                                                                         #
  # Promoção 884:                                                                           #
  # - Criar VT de 15 dias por R$17,00 com os seguintes SVAs:                                #
  # Skeelo Light, GoRead e Vivo Recado e franquia de 5GB e 8 STEPS.                         #
  # - Ela irá substituir a VT 861 (essa deixará de ser comercializada)                      #
  # - A primeira ativação serguirá como a 861, utilizando o mesmo mix e cobrando 10 reais   #
  # - A degustação será de 60 dias com cobrança de 10 reais para ativar                     #
  # - Os steps terão 2 fluxos, o normal e o de cadastro + ativação em steps                 #
  # - Terá apenas um grupo Nacional                                                         #
  #-----------------------------------------------------------------------------------------#



#####################################################################################################################################################################################
################################################################################# BOP ###############################################################################################
#####################################################################################################################################################################################



@Banco @ID-0001 @promotion
  Esquema do Cenario: Validar VT 884 - tabela BOP_CFG_PRM
    Dado o número do caso de teste "<testcase>"
    #Tabela principal onde contém as informações básicas da Promoção
    #Wiki de apoio: http://wiki.eisa.corp.com/pages/viewpage.action?pageId=133277628
    Então valido a consulta com os parametros:
    | TIPO   | BASE | TABELA       | PROMO_CODE   | DESCRIPTION   | SHORT_DESCRIPTION   | QTD |
    | SELECT | BDA  | BOP_CFG_PRM  | <PROMO_CODE> | <DESCRIPTION> | <SHORT_DESCRIPTION> | 1   |

    Exemplos:
    | testcase | PROMO_CODE | DESCRIPTION        | SHORT_DESCRIPTION  |
    | TC-0001  |   884      | Vivo Turbo 15 dias | Vivo Turbo 15 dias |



@Banco @ID-0002 @promotion
  Esquema do Cenario: Validar VT 884 - tabela BOP_CFG_PRM_TARGET
    Dado o número do caso de teste "<testcase>"
    #Tabela onde contém  Definição do público Alvo da Promoção
    #Wiki de apoio: http://wiki.eisa.corp.com/pages/viewpage.action?pageId=133277628
    Então valido a consulta com os parametros:
    | BASE | TIPO   | TABELA              | TARGET_ID    | DESCRIPTION   | QTD |
    | BDA  | SELECT | BOP_CFG_PRM_TARGET  | <TARGET_ID>  | <DESCRIPTION> |  1  |
    
    Exemplos:
    | testcase | TARGET_ID  |                  DESCRIPTION                                       |
    | TC-0001  |    700     |  Publico-alvo participante - Vivo Turbo 15 dias - GRP ALL          |
    | TC-0002  |    701     |  Grupo Novas Altas - 884                                           |
    | TC-0003  |    702     |  Publico-alvo - Novas Altas Primeira Chamada/Pre-Habilitacao - 884 |
    | TC-0004  |    703     |  Publico-alvo participante - Degustacao VT 884 - GRP ALL           |
    | TC-0005  |    704     |  Publico-alvo - Cancelado-Ativo - Gratuidade 884 - GRP ALL         |



@Banco @ID-0003 @promotion
  Esquema do Cenario: Validar VT 884 - tabela BOP_CFG_PRM_PROFILE_MAP
    Dado o número do caso de teste "<testcase>"
    #Tabela onde contém  Definição do público Alvo da Promoção
    #Wiki de apoio: http://wiki.eisa.corp.com/pages/viewpage.action?pageId=133277628
    Então valido a consulta com os parametros:
    | BASE | TIPO   | TABELA                   | TARGET_ID    |  CONFIG_AREA  | QTD |
    | BDA  | SELECT | BOP_CFG_PRM_PROFILE_MAP  | <TARGET_ID>  | <CONFIG_AREA> |  -1 |
    
    Exemplos:
    | testcase | TARGET_ID  | CONFIG_AREA |
    | TC-0001  | 700        |     11      |
    | TC-0002  | 700        |     12      |  
    | TC-0003  | 700        |     13      |
    | TC-0004  | 700        |     14      |  
    | TC-0005  | 700        |     15      |  
    | TC-0006  | 700        |     16      |  
    | TC-0007  | 700        |     17      |  
    | TC-0008  | 700        |     18      |
    | TC-0009  | 700        |     19      |  
    | TC-0010  | 700        |     21      |
    | TC-0011  | 700        |     22      |  
    | TC-0012  | 700        |     24      |  
    | TC-0013  | 700        |     27      |  
    | TC-0014  | 700        |     28      |  
    | TC-0015  | 700        |     31      |   
    | TC-0016  | 700        |     32      |   
    | TC-0017  | 700        |     33      |   
    | TC-0018  | 700        |     34      |   
    | TC-0019  | 700        |     35      |   
    | TC-0020  | 700        |     37      |   
    | TC-0021  | 700        |     38      |   
    | TC-0022  | 700        |     41      |   
    | TC-0023  | 700        |     42      |   
    | TC-0024  | 700        |     43      |   
    | TC-0025  | 700        |     44      |   
    | TC-0026  | 700        |     45      |   
    | TC-0027  | 700        |     46      |   
    | TC-0028  | 700        |     47      |   
    | TC-0029  | 700        |     48      |   
    | TC-0030  | 700        |     49      |   
    | TC-0031  | 700        |     51      |   
    | TC-0032  | 700        |     53      |   
    | TC-0033  | 700        |     54      |   
    | TC-0034  | 700        |     55      |   
    | TC-0035  | 700        |     61      |   
    | TC-0036  | 700        |     62      |   
    | TC-0037  | 700        |     63      |   
    | TC-0038  | 700        |     64      |
    | TC-0039  | 700        |     65      |   
    | TC-0040  | 700        |     66      |   
    | TC-0041  | 700        |     67      |   
    | TC-0042  | 700        |     68      |   
    | TC-0043  | 700        |     69      |   
    | TC-0044  | 700        |     71      |   
    | TC-0045  | 700        |     73      |   
    | TC-0046  | 700        |     74      |   
    | TC-0047  | 700        |     75      |   
    | TC-0048  | 700        |     77      |   
    | TC-0049  | 700        |     79      |   
    | TC-0050  | 700        |     81      |   
    | TC-0051  | 700        |     82      |   
    | TC-0052  | 700        |     83      |   
    | TC-0053  | 700        |     84      |   
    | TC-0054  | 700        |     85      |   
    | TC-0055  | 700        |     86      |   
    | TC-0056  | 700        |     87      |   
    | TC-0057  | 700        |     88      |   
    | TC-0058  | 700        |     89      |   
    | TC-0059  | 700        |     91      |   
    | TC-0060  | 700        |     92      |   
    | TC-0061  | 700        |     93      |   
    | TC-0062  | 700        |     94      |   
    | TC-0063  | 700        |     95      |   
    | TC-0064  | 700        |     96      |   
    | TC-0065  | 700        |     97      |   
    | TC-0066  | 700        |     98      |   
    | TC-0067  | 700        |     99      |   
    | TC-0068  | 701        |     17      |
    | TC-0069  | 701        |     21      |
    | TC-0070  | 701        |     22      |
    | TC-0071  | 701        |     24      |
    | TC-0072  | 701        |     27      |
    | TC-0073  | 701        |     37      |
    | TC-0074  | 701        |     42      |
    | TC-0075  | 701        |     49      |
    | TC-0076  | 701        |     55      |
    | TC-0077  | 701        |     62      |
    | TC-0078  | 701        |     71      |
    | TC-0079  | 701        |     87      |
    | TC-0080  | 702        |     11      |   
    | TC-0081  | 702        |     12      |  
    | TC-0082  | 702        |     13      |  
    | TC-0083  | 702        |     14      |  
    | TC-0084  | 702        |     15      |  
    | TC-0085  | 702        |     18      |  
    | TC-0086  | 702        |     19      |  
    | TC-0087  | 702        |     28      |  
    | TC-0088  | 702        |     31      |  
    | TC-0089  | 702        |     32      |  
    | TC-0090  | 702        |     33      |  
    | TC-0091  | 702        |     34      |  
    | TC-0092  | 702        |     35      |  
    | TC-0093  | 702        |     38      |  
    | TC-0094  | 702        |     41      |  
    | TC-0095  | 702        |     43      |  
    | TC-0096  | 702        |     44      |  
    | TC-0097  | 702        |     45      |  
    | TC-0098  | 702        |     46      |  
    | TC-0099  | 702        |     47      |  
    | TC-0100  | 702        |     48      |  
    | TC-0101  | 702        |     51      |  
    | TC-0102  | 702        |     53      |  
    | TC-0103  | 702        |     54      |  
    | TC-0104  | 702        |     61      |  
    | TC-0105  | 702        |     63      |  
    | TC-0106  | 702        |     64      |  
    | TC-0107  | 702        |     67      |  
    | TC-0108  | 702        |     69      |  
    | TC-0109  | 702        |     73      |  
    | TC-0110  | 702        |     74      |  
    | TC-0111  | 702        |     75      |  
    | TC-0112  | 702        |     77      |  
    | TC-0113  | 702        |     79      |  
    | TC-0114  | 702        |     82      |  
    | TC-0115  | 702        |     83      |  
    | TC-0116  | 702        |     84      |  
    | TC-0117  | 702        |     88      |  
    | TC-0118  | 702        |     89      |  
    | TC-0119  | 702        |     91      |  
    | TC-0120  | 702        |     92      |  
    | TC-0121  | 702        |     93      |  
    | TC-0122  | 702        |     94      |  
    | TC-0123  | 702        |     95      |  
    | TC-0124  | 702        |     96      |  
    | TC-0125  | 703        |     11      |
    | TC-0126  | 703        |     12      |
    | TC-0127  | 703        |     13      |
    | TC-0128  | 703        |     14      |
    | TC-0129  | 703        |     15      |
    | TC-0130  | 703        |     16      |
    | TC-0131  | 703        |     18      |
    | TC-0132  | 703        |     19      |
    | TC-0133  | 703        |     28      |
    | TC-0134  | 703        |     31      |
    | TC-0135  | 703        |     32      |
    | TC-0136  | 703        |     33      |
    | TC-0137  | 703        |     34      |
    | TC-0138  | 703        |     35      |
    | TC-0139  | 703        |     38      |
    | TC-0140  | 703        |     41      |
    | TC-0141  | 703        |     43      |
    | TC-0142  | 703        |     44      |
    | TC-0143  | 703        |     45      |
    | TC-0144  | 703        |     46      |
    | TC-0145  | 703        |     47      |
    | TC-0146  | 703        |     48      |
    | TC-0147  | 703        |     51      |
    | TC-0148  | 703        |     53      |
    | TC-0149  | 703        |     54      |
    | TC-0150  | 703        |     61      |
    | TC-0151  | 703        |     63      |
    | TC-0152  | 703        |     64      |
    | TC-0153  | 703        |     65      |
    | TC-0154  | 703        |     66      |
    | TC-0155  | 703        |     67      |
    | TC-0156  | 703        |     68      |
    | TC-0157  | 703        |     69      |
    | TC-0158  | 703        |     73      |
    | TC-0159  | 703        |     74      |
    | TC-0160  | 703        |     75      |
    | TC-0161  | 703        |     77      |
    | TC-0162  | 703        |     79      |
    | TC-0163  | 703        |     82      |
    | TC-0164  | 703        |     83      |
    | TC-0165  | 703        |     84      |
    | TC-0166  | 703        |     85      |
    | TC-0167  | 703        |     86      |
    | TC-0168  | 703        |     88      |
    | TC-0169  | 703        |     89      |
    | TC-0170  | 703        |     91      |
    | TC-0171  | 703        |     92      |
    | TC-0172  | 703        |     93      |
    | TC-0173  | 703        |     94      |
    | TC-0174  | 703        |     95      |
    | TC-0175  | 703        |     96      |
    | TC-0176  | 703        |     97      |
    | TC-0177  | 703        |     98      |
    | TC-0178  | 704        |     11      |
    | TC-0179  | 704        |     12      |
    | TC-0180  | 704        |     13      |
    | TC-0181  | 704        |     14      |
    | TC-0182  | 704        |     15      |
    | TC-0183  | 704        |     16      |
    | TC-0184  | 704        |     17      |
    | TC-0185  | 704        |     18      |
    | TC-0186  | 704        |     19      |
    | TC-0187  | 704        |     21      |
    | TC-0188  | 704        |     22      |
    | TC-0189  | 704        |     24      |
    | TC-0190  | 704        |     27      |
    | TC-0191  | 704        |     28      |
    | TC-0192  | 704        |     31      |
    | TC-0193  | 704        |     32      |
    | TC-0194  | 704        |     33      |
    | TC-0195  | 704        |     34      |
    | TC-0196  | 704        |     35      |
    | TC-0197  | 704        |     37      |
    | TC-0198  | 704        |     38      |
    | TC-0199  | 704        |     41      |
    | TC-0200  | 704        |     42      |
    | TC-0201  | 704        |     43      |
    | TC-0202  | 704        |     44      |
    | TC-0203  | 704        |     45      |
    | TC-0204  | 704        |     46      |
    | TC-0205  | 704        |     47      |
    | TC-0206  | 704        |     48      |
    | TC-0207  | 704        |     49      |
    | TC-0208  | 704        |     51      |
    | TC-0209  | 704        |     53      |
    | TC-0210  | 704        |     54      |
    | TC-0211  | 704        |     55      |
    | TC-0212  | 704        |     61      |
    | TC-0213  | 704        |     62      |
    | TC-0214  | 704        |     63      |
    | TC-0215  | 704        |     64      |
    | TC-0216  | 704        |     65      |
    | TC-0217  | 704        |     66      |
    | TC-0218  | 704        |     67      |
    | TC-0219  | 704        |     68      |
    | TC-0220  | 704        |     69      |
    | TC-0221  | 704        |     71      |
    | TC-0222  | 704        |     73      |
    | TC-0223  | 704        |     74      |
    | TC-0224  | 704        |     75      |
    | TC-0225  | 704        |     77      |
    | TC-0226  | 704        |     79      |
    | TC-0227  | 704        |     81      |
    | TC-0228  | 704        |     82      |
    | TC-0229  | 704        |     83      |
    | TC-0230  | 704        |     84      |
    | TC-0231  | 704        |     85      |
    | TC-0232  | 704        |     86      |
    | TC-0233  | 704        |     87      |
    | TC-0234  | 704        |     88      |
    | TC-0235  | 704        |     89      |
    | TC-0236  | 704        |     91      |
    | TC-0237  | 704        |     92      |
    | TC-0238  | 704        |     93      |
    | TC-0239  | 704        |     94      |
    | TC-0240  | 704        |     95      |
    | TC-0241  | 704        |     96      |
    | TC-0242  | 704        |     97      |
    | TC-0243  | 704        |     98      |
    | TC-0244  | 704        |     99      |




@Banco @ID-0004 @promotion
   Esquema do Cenario: Validar VT 884 - tabela BOP_CFG_PRM_ACTION_LST
   Dado o número do caso de teste "<testcase>"
    #Tabela onde contém   Definição da lista de ações da Promoção
    #Wiki de apoio: http://wiki.eisa.corp.com/pages/viewpage.action?pageId=133277628
   Então valido a consulta com os parametros:
   | BASE | TIPO   | TABELA                  | ACTION_LST_ID    | DESCRIPTION   | QTD |
   | BDA  | SELECT | BOP_CFG_PRM_ACTION_LST  | <ACTION_LST_ID>  | <DESCRIPTION> |  1  |
   
   Exemplos:
   | testcase | ACTION_LST_ID |                   DESCRIPTION                                             |
   | TC-0001  |     6400	    | Ativacao Cancelado para ativo - GRPN                                      |
   | TC-0002  |     6401	    | Ativacao na Migracao Pos->Pre e Controle->Pre - GRPN                      |
   | TC-0003  |     6402	    | Lista de ativacao da promo 884 com remocao de agente no CCA - De 1 para 2 |
   | TC-0004  |     6403	    | Lista de ativacao da promo 884 com remocao de agente no CCA - De 7 para 2 |
   | TC-0005  |     6404	    | Lista de desativacao da promo 884 com remocao de agente no CCA            |
   | TC-0006  |     6405      | Lista de falha na antecipacao de renovacao da Promo 884 GRPN              |
   | TC-0007  |     6406	    | Vivo Turbo 15 dias - ACT Pkg. c/ Taxa de adesao - GN                      |
   | TC-0008  |     6407	    | Vivo Turbo 15 dias - ACT Pkg. e DES Serv. Limiar Saldo - GN               |
   | TC-0009  |     6408      | Vivo Turbo 15 dias - Agenda adesao, ACT Serv Lim. e SMS - GN              |
   | TC-0010  |     6409	    | Vivo Turbo 15 dias - Ativ Combo Chip GN                                   |
   | TC-0011  |     6410	    | Vivo Turbo 15 dias - Ativ Combo Chip Varejo GN                            |
   | TC-0012  |     6411      | Vivo Turbo 15 dias - CAD Massivo por TAG - GN                             |
   | TC-0013  |     6412	    | Vivo Turbo 15 dias - DES Pacote Dgt. - GN                                 |
   | TC-0014  |     6413	    | Vivo Turbo 15 dias - DES Pct. Sem. - GN                                   |
   | TC-0015  |     6414      | Vivo Turbo 15 dias - DES Serv. Alarme - GN                                |
   | TC-0016  |     6415	    | Vivo Turbo 15 dias - Desat. Pelo estado linha Cancelado - ACT             |
   | TC-0017  |     6416	    | Vivo Turbo 15 dias - Desat. Pelo estado linha Cancelado - CAD             |
   | TC-0018  |     6417      | Vivo Turbo 15 dias - PAT Massivo por TAG - GN                             |
   | TC-0019  |     6418	    | Vivo Turbo 15 dias - PRE ATIVA promocao com CB - GN                       |
   | TC-0020  |     6419	    | Vivo Turbo 15 dias - SMS Ja Ativado - GN                                  |
   | TC-0021  |     6420      | Vivo Turbo 15 dias - SMS Ja Cadastrado - GN                               |
   | TC-0022  |     6421	    | Vivo Turbo 15 dias - cadastro, ACT Serv Lim. e SMS - GN                   |






@Banco @ID-0005 @promotion 
    Esquema do Cenario: Validar VT 884 - tabela BOP_CFG_PRM_STT_ACTION
    Dado o número do caso de teste "<testcase>"
    #Cadastro das aplicabilidades ( regra que define a ativação da promoção )
    #Wiki de apoio: http://wiki.eisa.corp.com/pages/viewpage.action?pageId=133277628
    Então valido a consulta com os parametros:
    | BASE | TIPO   | TABELA                  | PROMO_CODE | QTD    |
    | BDA  | SELECT | BOP_CFG_PRM_STT_ACTION  |   884      | 141    |

    Exemplos:
    | testcase |
		|  TC-0001 |
 




@Banco @ID-0006 @promotion 
 Esquema do Cenario: Validar VT 884 - tabela BOP_CFG_GENERIC_BNF
 Dado o número do caso de teste "<testcase>"
 #Tabela para criação dos benefícios
 #Wiki de apoio: http://wiki.eisa.corp.com/pages/viewpage.action?pageId=133277628
		Então valido a consulta com os parametros:
			| TIPO   | BASE | TABELA 	            |  BNF_CODE    | PARAM1   | QTD |
			| SELECT | BDA  | BOP_CFG_GENERIC_BNF |  <BNF_CODE>  | <PARAM1> | 1   |

		Exemplos:
			| testcase | BNF_CODE | PARAM1          |
			# |  TC-0001 | BSD43    | PCT_CMB_VT19MSL |
			# |  TC-0002 | BSD44    | CAD_ALARM_VT19  |
			# |  TC-0003 | BSD45    | PCT_CMB_VT19DEG |
			# |  TC-0004 | BV19AL   | CAD_ALARM_VT19  |
      # |  TC-0005 | BV19ALM  | CAD_ALARM_VT19  |
			# |  TC-0006 | BV19AP   | PCT_CMB_VT19MSL |
			# |  TC-0007 | BV19BI   | SRV_ACT_RF_VT19 |
			|  TC-0008 | BV19DD   | PCT_CMB_VT19DEG |
			|  TC-0009 | BV19DL   | CAD_ALARM_VT19  |
    	|  TC-0010 | BV19DP   | PCT_CMB_VT19MSL |
      |  TC-0011 | BV19RP   | PCT_CMB_VT19MSL |




@Banco @ID-0007 @promotion 
  Esquema do Cenario: Validar VT 884 - tabela BOP_CFG_STEP_DOWN_MAP
  Dado o número do caso de teste "<testcase>"
    ##Template de apoio: PrePago_T474595_CFG563845_StepsVivoTurbo_AlavancagemStepDown_20.2.0
    Então valido a consulta com os parametros:
      | BASE | TIPO   | TABELA                | PROMO_CODE   | SERVICE         | STEP_ID   | DESCRIPTION   | STEP_COST   | NUM_DAYS_VAL   | DATA_QUOTA   |  QTD |
      | BDA  | SELECT | BOP_CFG_STEP_DOWN_MAP | 884          | PCT_CMB_VT3_MSL | <STEP_ID> | <DESCRIPTION> | <STEP_COST> | <NUM_DAYS_VAL> | <DATA_QUOTA> |  1   |

    Exemplos:
      | testcase | STEP_ID                | DESCRIPTION                                 | STEP_COST | NUM_DAYS_VAL | DATA_QUOTA |
      | TC-0001  | PCT_CMB_VT19MSL        | Vivo Turbo 15 dias                          | 17.00     | 15           | 5368709120 |
      | TC-0002  | PCT_CMB_VT19MSL_STEP_2 | Vivo Turbo 15 dias (Parc. 15,00 p/12 dias)  | 15.00     | 12           | 4294967296 |
      | TC-0003  | PCT_CMB_VT19MSL_STEP_3 | Vivo Turbo 15 dias (Parc. 12,00 p/10 dias)  | 12.00     | 10           | 3221225472 |
      | TC-0004  | PCT_CMB_VT19MSL_STEP_4 | Vivo Turbo 15 dias (Parc. 10,00 p/ 7 dias)  | 10.00     | 7            | 2684354560 |
      | TC-0005  | PCT_CMB_VT19MSL_STEP_5 | Vivo Turbo 15 dias (Parc. 8,00 p/ 5 dias)   |  8.00     | 5            | 1610612736 |
      | TC-0006  | PCT_CMB_VT19MSL_STEP_6 | Vivo Turbo 15 dias (Parc. 6,00 p/ 4 dias)   |  6.00     | 4            | 1073741824 |
      | TC-0007  | PCT_CMB_VT19MSL_STEP_7 | Vivo Turbo 15 dias (Parc. 3,00 p/ 2 dias)   |  3.00     | 2            | 524288000  |
      | TC-0008  | PCT_CMB_VT19MSL_STEP_8 | Vivo Turbo 15 dias (Parc. 1,00 p/ 1 dia)    |  1.00     | 1            | 262144000  |





@Banco @ID-0008 @promotion 
 Esquema do Cenario: Validar VT 884 - tabela S3G_CFG_NOTIFY_PROP
 Dado o número do caso de teste "<testcase>"
 #Tabela para criação dos benefícios
 #Wiki de apoio: http://wiki.eisa.corp.com/pages/viewpage.action?pageId=133277628
		Então valido a consulta com os parametros:
			| TIPO   | BASE | TABELA 	            |  CODE    | DESCRIPTION   | QTD |
			| SELECT | SDP  | S3G_CFG_NOTIFY_PROP | <CODE>   | <DESCRIPTION> | 1   |

		Exemplos:
			| testcase | CODE  | DESCRIPTION        |
			|  TC-0001 | 884   | Vivo Turbo 15 dias |





@Banco @ID-0009 @promotion 
   Esquema do Cenario: Validar VT 884 - tabela CTC_TAGS 
   Dado o número do caso de teste "<testcase>"
    #Tabela de definição de tags que impactará na Promoção para o evento de TAG.
    #Wiki de apoio: http://wiki.eisa.corp.com/pages/viewpage.action?pageId=133277628
   Então valido a consulta com os parametros:
   | BASE | TIPO   | TABELA   |  CODE    | DESCRIPTION | QTD |
   | BDA  | SELECT | CTC_TAGS | <codigo> | <descricao> |  1  |
   | BDB  | SELECT | CTC_TAGS | <codigo> | <descricao> |  1  |

   Exemplos:
   | testcase |  codigo         | descricao                              |
   | TC-0001  |  CAD_VIVOTUDO19 | Vivo Turbo 15 dias - Pre-Ativo Massivo |
   | TC-0002  |  PAT_VIVOTUDO19 | Vivo Turbo 15 dias - Cadastro Massivo  |





@Banco @ID-0010 @promotion 
   Esquema do Cenario: Validar VT 884 - tabela CTC_TAG_OPERATION 
   Dado o número do caso de teste "<testcase>"
    #Tabela de definição de tags que impactará na Promoção para o evento de TAG.
    #Wiki de apoio: http://wiki.eisa.corp.com/pages/viewpage.action?pageId=133277628
   Então valido a consulta com os parametros:
   | BASE | TIPO   | TABELA            |  OPERATION  | TAG_CODE   | QTD    |
   | BDA  | SELECT | CTC_TAG_OPERATION |     316     | <TAG_CODE> | <QTD>  |

   Exemplos:
   | testcase |  TAG_CODE       | QTD |
   | TC-0001  |  CAD_VIVOTUDO19 |  4  |
   | TC-0002  |  PAT_VIVOTUDO19 |  4  |






@Banco @ID-0011 @promotion 
   Esquema do Cenario: Validar VT 884 - tabela ACC_CFG_COMBO (COMBO CHIP)
   Dado o número do caso de teste "<testcase>"
    #Tabela de definição de tags que impactará na Promoção para o evento de TAG.
    #Wiki de apoio: http://wiki.eisa.corp.com/pages/viewpage.action?pageId=133277628
   Então valido a consulta com os parametros:
   | BASE | TIPO   | TABELA         |  PROMO_CODE  | COMBO_NAME   | DESCRIPTION   | MIX_CODE | QTD  |
   | BDA  | SELECT | ACC_CFG_COMBO  |     884      | <COMBO_NAME> | <DESCRIPTION> |  224     |  1   |

   Exemplos:
   | testcase |  COMBO_NAME     | DESCRIPTION                                                |
   | TC-0001  |  Combo 1        | Chip Pre + Recarga 10 + Promo Vivo Tudo + Plan vigente     |
   | TC-0002  |  Combo 2        | Chip Pre + Recarga 15 + Promo Vivo Tudo + Plan vigente     |
   | TC-0003  |  Combo Varejo 1 | Chip Pre Combo no Varejo + Promo Vivo Turbo + Plan vigente |




#####################################################################################################################################################################################
################################################################################# EXTRATO E OPERACOES ###############################################################################
#####################################################################################################################################################################################




@Banco @ID-0012 @life_cycle
  Esquema do Cenario: Validar VT 875 - tabelas CAR_TDR_OPERATION /  CAR_TDR_MAPPING / CAR_DETAILED_EXTRACT_CONFIG
  #Template de apoio: PrePago_T258349_CFG564237_SimplicacaoExtratoDetalhado_n_20.2.0 ( Abas: DESCRIÇÃO MAPEADA / TELA DE OPERAÇÕES / MAPEAMENTO EXTRATO DETALHADO )
  Dado o número do caso de teste "<testcase>"

    Então valido a consulta com os parametros:
      | BASE | TIPO   | TABELA            |  CODE    | DESCRIPTION                                        | QTD |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo15 dias - Franquia                       |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias - Skeelo Light                  |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias - GoRead                        |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias - Vivo Recado                   |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc.15,00 p/12d)-Franquia      |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc.15,00 p/12d)-Skeelo Light  |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc.15,00 p/12d)-Go Read       |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc.15,00 p/12d)-Vivo Recado   |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 12,00 p/ 10d)-Franquia    |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 12,00 p/ 10d)-Skeelo Light|  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 12,00 p/ 10d)-Go Read     |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 12,00 p/ 10d)-Vivo Recado |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 10,00 p/ 7d)-Franquia     |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 10,00 p/ 7d)-Skeelo Light |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 10,00 p/ 7d)-Go Read      |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 10,00 p/ 7d)-Vivo Recado  |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 8,00 p/ 5d)-Franquia      |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 8,00 p/ 5d)-Skeelo Light  |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 8,00 p/ 5d)-Go Read       |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 8,00 p/ 5d)-Vivo Recado   |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 6,00 p/ 4d)-Franquia      |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 6,00 p/ 4d)-Skeelo Light  |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 6,00 p/ 4d)-Go Read       |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 6,00 p/ 4d)-Vivo Recado   |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 3,00 p/ 2d)-Franquia      |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 3,00 p/ 2d)-Skeelo Light  |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 3,00 p/ 2d)-Go Read       |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 3,00 p/ 2d)-Vivo Recado   |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 1,00 p/ 1d)-Franquia      |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 1,00 p/ 1d)-Skeelo Light  |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 1,00 p/ 1d)-Go Read       |  1  |
      | BDB  | SELECT | CAR_TDR_OPERATION | <codigo> | Vivo Turbo 15 dias(Parc. 1,00 p/ 1d)-Vivo Recado   |  1  |
    Então valido a consulta com os parametros:
      | BASE | TIPO   | TABELA          | OPERATION_COD |  INFO19 |  CC_OPERATION  |  INFO24  | QTD |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_TDR_MAPPING |       3       |    DEP  |    <codigo>    | <motivo> |  1  |
    Então valido a consulta com os parametros:
      | BASE | TIPO   | TABELA                      | OPERATION_COD | OPERATION_DESC  |  REASON  | QTD |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |
      | BDB  | SELECT | CAR_DETAILED_EXTRACT_CONFIG |       3       |     <codigo>    | <motivo> |  1  |

    Exemplos:
      | testcase | codigo  | motivo |
      | TC-0001  |  2091   |  6563  |
      | TC-0002  |  2092   |  6564  |
      | TC-0003  |  2093   |  6565  |
      | TC-0004  |  2094   |  6566  |
      | TC-0005  |  2095   |  6567  |
      | TC-0006  |  2096   |  6568  |
      | TC-0007  |  2097   |  6569  |
      | TC-0008  |  2098   |  6570  |
      | TC-0009  |  2099   |  6571  |
      | TC-0010  |  2100   |  6572  |
      | TC-0011  |  2101   |  6573  |
      | TC-0012  |  2102   |  6574  |
      | TC-0013  |  2103   |  6575  |
      | TC-0014  |  2104   |  6576  |
      | TC-0015  |  2105   |  6577  |
      | TC-0016  |  2106   |  6578  |
      | TC-0017  |  2107   |  6579  |
      | TC-0018  |  2108   |  6580  |
      | TC-0019  |  2109   |  6581  |
      | TC-0020  |  2110   |  6582  |
      | TC-0021  |  2111   |  6583  |
      | TC-0022  |  2112   |  9458  |
      | TC-0023  |  2113   |  9463  |
      | TC-0024  |  2114   |  9464  |
      | TC-0025  |  2115   |  9465  |
      | TC-0026  |  2116   |  9470  |
      | TC-0027  |  2117   |  9471  |
      | TC-0028  |  2118   |  9532  |
      | TC-0029  |  2119   |  9546  |
      | TC-0030  |  2120   |  1700  |
      | TC-0031  |  2121   |  9548  |
      | TC-0032  |  2122   |  9549  |





@Banco @ID-0013 @life_cycle
   Esquema do Cenario: Validar VT 884 - tabelas CAR_TDR_CCA_DETAILED 
   #Template de apoio: PrePago_T258349_CFG564237_SimplicacaoExtratoDetalhado_n_20.2.0
    Dado o número do caso de teste "<testcase>"

    Então valido a consulta com os parametros:
      | BASE | TIPO   | TABELA               |  INFO24    | CC_OPERATION    | INFO19    | QTD |
      | BDB  | SELECT | CAR_TDR_CCA_DETAILED | <INFO24>   | <CC_OPERATION>  | <INFO19>  |  1  |

    Exemplos:
      | testcase | INFO24  | CC_OPERATION | INFO19 |
      | TC-0001  |  3133   |  2080        |  CRD   |
      | TC-0002  |  3133   |  2081        |  CRD   |
      | TC-0003  |  3133   |  2082        |  CRD   |
      | TC-0004  |  3133   |  2083        |  CRD   |
      | TC-0005  |  3139   |  2084        |  ACR   |
      | TC-0006  |  3145   |  2085        |  CRD   |
      | TC-0007  |  3145   |  2086        |  CRD   |
      | TC-0008  |  3145   |  2087        |  CRD   |
      | TC-0009  |  3145   |  2088        |  CRD   |




#####################################################################################################################################################################################
################################################################################# ORIGINADOR E AGRUPADOR ############################################################################
#####################################################################################################################################################################################


@Banco @ID-0014 @promotion
   Esquema do Cenario: Validar VT 884 - tabela  NGIN_PLFS_ORIGIN_CONFIG
    Dado o número do caso de teste "<testcase>"
    # template de apoio: PrePago_T266545_CFG563841_Originador_Saldo_OfertasMensal_884_20.2.0 ( ABA: PACOTES_CORE )
      E valido a consulta com os parametros:      
      | TIPO   | BASE | TABELA                  | OPERATOR | PLF_TYPE    | ORIGIN_ID   | DESCRIPTION | PRIORITY   | QTD |
      | SELECT | BDA  | NGIN_PLFS_ORIGIN_CONFIG |    -1    | <PLF_TYPE>  | <ORIGIN_ID> | <descricao> | <priority> |  1  |

      Exemplos:
      | testcase | ORIGIN_ID       | descricao                                  | priority | PLF_TYPE |
      | TC-0001  | PCT_CMB_VT19MSL | Vivo Turbo 15 dias – Franquia Internet     |   566    |  81      |
      | TC-0002  | PCT_CMB_VT19DEG | Vivo Turbo 15 dias Deg - Franquia Internet |   567    |  81      |
      | TC-0003  | PCK_VT_CMB_884  | Vivo Turbo - Bonus em Dobro 6 meses        |   568    |  149     | 



@Banco @ID-0015 @life_cycle
  Esquema do Cenario:   Validar VT 884 - tabela PAY_CFG_PLAFOND_ORIGIN_DESC
  Dado o número do caso de teste "<testcase>"
  # template de apoio: PrePago_T266545_CFG563841_Originador_Saldo_OfertasMensal_884_20.2.0 ( ABA: PACOTES_CARE) )
    Então valido a consulta com os parametros:
      | TIPO   | BASE | TABELA          			       |  ORIGIN_ID    |  DESCRIPTION  | PLAFOND_TYPE  | CLIENT_TYPE    | PROFILE | PRIORITY | QTD |
      | SELECT | BDA  | PAY_CFG_PLAFOND_ORIGIN_DESC  |  <ORIGIN_ID>  |  <descricao>  |  <PLF_TYPE>   | <CLIENT_TYPE>  |    *    |    100   |  1  |

    Exemplos:
      | testcase | PLF_TYPE  | ORIGIN_ID           | descricao                                      | CLIENT_TYPE |
      | TC-0001  |  149      |  PCK_VT_CMB_884     |  Vivo Turbo - Bonus em Dobro 6 meses           |     7       |
      | TC-0002  |  81       |  PCT_CMB_VT19DEG    |  Vivo Turbo 15 dias Deg - Franquia Internet    |     *       |
      | TC-0003  |  72       |  PCT_CMB_VT19DEG    |  Vivo Turbo 15 dias - Franquia Minutos on-net  |     *       |
      | TC-0004  |  73       |  PCT_CMB_VT19DEG    |  Vivo Turbo 15 dias - SMS/MMS                  |     *       |
      | TC-0005  |  69       |  PCT_CMB_VT19DEG    |  Vivo Turbo 15 dias - SMS/MMS off net          |     *       |
      | TC-0006  |  68       |  PCT_CMB_VT19DEG    |  Vivo Turbo 15 dias - Franquia Minutos off-net |     *       |
      | TC-0007  |  72       |  PCT_CMB_VT19MSL    |  Vivo Turbo 15 dias - Franquia Minutos on-net  |     *       |
      | TC-0008  |  73       |  PCT_CMB_VT19MSL    |  Vivo Turbo 15 dias - SMS/MMS                  |     *       |
      | TC-0009  |  69       |  PCT_CMB_VT19MSL    |  Vivo Turbo 15 dias - SMS/MMS off net          |     *       |
      | TC-0010  |  68       |  PCT_CMB_VT19MSL    |  Vivo Turbo 15 dias - Franquia Minutos off-net |     *       |
      | TC-0011  |  81       |  PCT_CMB_VT19MSL    |  Vivo Turbo 15 dias - Franquia Internet        |     *       |



@Banco @ID-0016 @life_cycle
  Esquema do Cenario: Validar VT 884 - tabela PAY_CFG_ORIGIN_GROUP_MAP
   #Template de apoio: PrePago_T270977_CFG563843_AgrupadorDeSaldo_OfertaMensal_884_20.2.0 ABA PACOTES
    Dado o número do caso de teste "<testcase>"
    Então valido a consulta com os parametros:
      | TIPO   | BASE | TABELA                   | ORIGIN_ID    | PLAFOND_TYPE | ORIGIN_GROUP     | PRIORITY    | QTD |
      | SELECT | BDA  | PAY_CFG_ORIGIN_GROUP_MAP | <originador> |  <PLF_TYPE>  | <ORIGIN_GROUP>   | <PRIORITY>  |  1  |

    Exemplos:
      | testcase  | originador       | PLF_TYPE | PRIORITY | ORIGIN_GROUP  |
      |  TC-0001  | PCT_CMB_VT19MSL  |  81      | 800      |        10     |
      |  TC-0002  | PCT_CMB_VT19DEG  |  81      | 800      |        10     |
      |  TC-0003  | PCK_VT_CMB_884   |  149     | 100      |        7      | 



@Banco @ID-0017 @promotion
  Esquema do Cenario: Validar VT 884 - tabela  NGIN_PLFS_ORIGIN_ID_PROP
    # Template de apoio: PrePago_T270977_CFG563843_AgrupadorDeSaldo_OfertaMensal_884_20.2.0 (ABA: VALIDADE_SALDO_CONSULTA )
    Dado o número do caso de teste "<testcase>"
    Então valido a consulta com os parametros:
      | BASE | TIPO   | TABELA                   | VERSION   | SK   | OPERATOR   | CLIENT_TYPE   | PROFILE   | PLF_TYPE   | ORIGIN_ID   | PROPERTY_ID   | PROPERTY_VALUE   | DESCRIPTION   | QTD   |
      | SDP  | SELECT | NGIN_PLFS_ORIGIN_ID_PROP | <VERSION> | <SK> | <OPERATOR> | <CLIENT_TYPE> | <PROFILE> | <PLF_TYPE> | <ORIGIN_ID> | <PROPERTY_ID> | <PROPERTY_VALUE> | <DESCRIPTION> | <QTD> |
      
      Exemplos:
      | testcase | VERSION | SK | OPERATOR | CLIENT_TYPE | PROFILE | PLF_TYPE | ORIGIN_ID        | PROPERTY_ID | PROPERTY_VALUE  | DESCRIPTION                                      | QTD |
      | TC-0001  | 1       | 25 | -1       | -1          | -1      | 149      | PCK_VT_CMB_884   | 5           | 1               | subtrai 0.99999 da data de expiracao             | 1   |
      | TC-0002  | 1       | 25 | -1       | -1          | -1      | 149      | PCK_VT_CMB_884   | 1           | 1               | Remove saldo consumido                           | 1   |
      | TC-0003  | 1       | 25 | -1       | -1          | -1      | 81       | PCT_CMB_VT19DEG  | 1           | 0               | Remove saldo consumido                           | 1   |
      | TC-0004  | 1       | 25 | -1       | -1          | -1      | 81       | PCT_CMB_VT19DEG  | 7           | AGGLUTINATION_F | Aglutinacao de saldo (forcado)                   | 1   |
      | TC-0005  | 1       | 25 | -1       | -1          | -1      | 81       | PCT_CMB_VT19DEG  | 6           | AGGLUTINATION   | Aglutinacao de saldos (mesma data inicial e fim) | 1   |
      | TC-0006  | 1       | 25 | -1       | -1          | -1      | 81       | PCT_CMB_VT19MSL  | 8           | 0               | Valor minimo de saldo para o Refresh             | 1   |
      | TC-0007  | 1       | 25 | -1       | -1          | -1      | 81       | PCT_CMB_VT19MSL  | 7           | AGGLUTINATION_F | Aglutinacao de saldo (forcado)                   | 1   |
      | TC-0008  | 1       | 25 | -1       | -1          | -1      | 81       | PCT_CMB_VT19MSL  | 6           | AGGLUTINATION   | Aglutinacao de saldos (mesma data inicial e fim) | 1   |
      | TC-0009  | 1       | 25 | -1       | -1          | -1      | 81       | PCT_CMB_VT19MSL  | 1           | 0               | Remove saldo consumido                           | 1   |
      | TC-0010  | 1       | 25 | -1       | -1          | -1      | 81       | PCT_CMB_VT19MSL  | 5           | 1               | subtrai 1 da data de expiracao                   | 1   |
      | TC-0011  | 1       | 25 | -1       | -1          | -1      | 71       | PCT_CMB_VT19MSL  | 5           | 1               | subtrai 1 da data de expiracao                   | 1   |





@Banco @ID-0018 @life_cycle
  Esquema do Cenario:   Validar VT 884 - tabela S3G_CFG_ORIGIN_DESC
        Dado o número do caso de teste "<testcase>"

        Então valido a consulta com os parametros:
        | BASE | TIPO   | TABELA              | ORIGIN_ID   | DESCRIPTION   | QTD |
        | SDP  | SELECT | S3G_CFG_ORIGIN_DESC | <ORIGIN_ID> | <DESCRIPTION> |  8  |

        Exemplos:
        | testcase | ORIGIN_ID       | DESCRIPTION                                |
        | TC-0001  | PCT_CMB_VT19MSL | Vivo Turbo 15 dias – Franquia Internet     |
        | TC-0002  | PCT_CMB_VT19DEG | Vivo Turbo 15 dias Deg - Franquia Internet |
        | TC-0003  | PCK_VT_CMB_884  | Vivo Turbo - Bonus em Dobro 6 meses        |




#####################################################################################################################################################################################
################################################################################ SERVICOS ###########################################################################################
#####################################################################################################################################################################################



@Banco @ID-0019 @life_cycle
  Esquema do Cenario: Validar VT 884 - tabela S3G_CFG_PRF_ALARMS_CONFIG
  ## Nessa tabela é configurado o alarme, também aponta quais são os alarmes que definem cada contador
  ## Template de apoio PrePago_T85944_CFG559691_Alarmes_Alteracao_VTs_875_865_15D_v20.2.0 (ABA:Alarmes)
  Dado o número do caso de teste "<testcase>"
  Então valido a consulta com os parametros:
    | TIPO   | BASE | TABELA                    | ALARM_ID    | THRESHOLDS   | DESCRIPTION    | QTD  |
    | SELECT | SDP  | S3G_CFG_PRF_ALARMS_CONFIG | <ID_ALARME> | <THRESHOLDS> | <DESCRIPTION>  | -1   |

  Exemplos:
    | testcase | ID_ALARME | THRESHOLDS   |  DESCRIPTION            |
    | TC-0001  |    215    | T1=17;T2=1   |  Limiar de Saldo VT 15d |



@Banco @ID-0020 @life_cycle    
   Esquema do Cenario: Verificar Operações na SRV_CFG_PROPER_OPERATION
   Dado o número do caso de teste "<testcase>"
   Então valido a consulta com os parametros:
   | BASE | TIPO   | TABELA                   | SERVICE   | OPERATION   | PROPER_OPERATION | SRV_INTERFACE_ID   | PRIORITY |QTD | 
   | BDA  | SELECT | SRV_CFG_PROPER_OPERATION | <SERVICE> |    DES      |      RMV         | RMV_PROFILE_SRV    | 900      | 1  |
   
  Exemplos: 
   | testcase | SERVICE         |  
   | TC-0001  | PCT_CMB_VT19MSL |  




@Banco @ID-0021 @life_cycle
  Esquema do Cenario: Validacao da descricao do novo servico VT 884
    #PrePago_T86008_CFG563824_Servicos_884_20.2.0
    #PrePago_T86008_CFG563826_Servicos_VivoTurbo_SVA_v20.2.0
    #PrePago_T86008_CFG563828_Servicos_VivoTurboRefreshVTMensal_884_v20.2.0
    #PrePago_T86009_CFG563832_Pacotes_VTComboChipBonusDobro_v20.2.0
    Dado o número do caso de teste "<testcase>"
    E valido a consulta com os parametros:
      | TIPO   | BASE | TABELA      | CODE     | COMMERCIAL_NAME | QTD  |
      | SELECT | BDA  | SRV_SERVICE | <CODE>   |<COMMERCIAL_NAME>|  1   |
      | SELECT | BDB  | SRV_SERVICE | <CODE>   |<COMMERCIAL_NAME>|  1   |
    
    Exemplos:
      | testcase | CODE            |      COMMERCIAL_NAME                    |
      | TC-0001  | SRV_TARIFA_VT19 |  Servico Basico - Vivo Turbo 15 dias    |
      | TC-0002  | CAD_ALARM_VT19  |  Srv de Cad Alarme - Vivo Turbo 15 dias |
      | TC-0003  | CCA_CAD_884     |  Cadastro CCA - Vivo Turbo 15 dias      |
      | TC-0004  | SRV_ACT_RF_VT19 |  Vivo Turbo BIS 15 DIAS                 |
      | TC-0005  | PCK_VT_CMB_884  |  Vivo Turbo 15 dias em Dobro 6 meses    |
      | TC-0006  | PCT_CMB_VT19MSL |  Vivo Turbo 15 dias                     |
      | TC-0007  | PCT_CMB_VT19DEG |  Vivo Turbo 15 dias Deg.                | 
      | TC-0008  | SRV_SVA_PRE11   |  Serv. Combo Dig. Pre11(Skeelo L+GoRead+VivoRecado) |




@Banco @ID-0022 @life_cycle
  Esquema do Cenario:   Validar VT 884 - tabela SRV_ACC_STATE_VALIDATION
  #PrePago_T86008_CFG563824_Servicos_884_20.2.0
  #PrePago_T86008_CFG563826_Servicos_VivoTurbo_SVA_v20.2.0
  #PrePago_T86008_CFG563828_Servicos_VivoTurboRefreshVTMensal_884_v20.2.0
  #PrePago_T86009_CFG563832_Pacotes_VTComboChipBonusDobro_v20.2.0
  Dado o número do caso de teste "<testcase>"
  Então valido a consulta com os parametros:
  | TIPO   | BASE | TABELA                   | SERVICE   | PROFILE         | ACC_STATE   | SRV_OPERATION   | CLIENT_TYPE | QTD |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | BAALTOVAL1GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | BAALTOVAL2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | BADIAGSM        | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | BAMAISMSGGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | BAPREDADOGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | BAPREDIAR2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | BAPREDIAR3GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | BAPREDIARIOGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | BARESPREGSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | BASICOGSM       | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | BAVIVODIAGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | BAVIVONOITEGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | BAVIVOTODAGSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | GOLGSM          | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | JOVEMGSM        | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | LIVREGOSPELGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | LIVREGSM        | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | LIVREMTVGSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGALTOVAL1GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGALTOVAL2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGCONTROLGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGCTRLEMPGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGFLEX45GSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGFLEX85GSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGMAISMSGGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGNOITEGSM      | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGPREDADOGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGPREDIAR2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGPREDIAR3GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGPREDIARIOGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGRESPREGSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGVIVODIAGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGVIVONOITEGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | MGVIVOTODAGSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | NEALTOVAL1GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | NEALTOVAL2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | NEMAISMSGGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | NEPREDADOGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | NEPREDIAR2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | NEPREDIAR3GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | NEPREDIARIOGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | NERESPREGSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | NEVIVODIAGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | NEVIVONOITEGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | NEVIVOTODAGSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRALTOVAL1GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRALTOVAL2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRBASICOGSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRJOVEMGSM      | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRLIVRE1GSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRLIVREGSM      | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRMAISMSGGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRPREDADOGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRPREDIAR2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRPREDIAR3GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRPREDIARIOGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRRESPREGSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRVIVODIAGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRVIVONOITEGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | PRVIVOTODAGSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJALTOVAL1GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJALTOVAL2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJBASICOGSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJDIAGSM        | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJMAISMSGGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJNOITEGSM      | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJPREDADOGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJPREDIAR2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJPREDIAR3GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJPREDIARIOGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJRESPREGSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJTODAGSM       | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJVIVODIAGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJVIVONOITEGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RJVIVOTODAGSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSALTOVAL1GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSALTOVAL2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSBASICOGSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSDIAGSM        | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSMAISMSGGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  | 
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSNOITEGSM      | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSPREDADOGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSPREDIAR2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSPREDIAR3GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSPREDIARIOGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSRESPREGSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSTODAGSM       | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSVIVODIAGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSVIVONOITEGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | RSVIVOTODAGSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | SPALTOVAL1GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | SPALTOVAL2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | SPMAISMSGGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | SPPREDADOGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | SPPREDIAR2GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | SPPREDIAR3GSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | SPPREDIARIOGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | SPRESPREGSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | TCOALTOVAL1GSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | TCOALTOVAL2GSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | TCOLIVREGSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | TCOMAISMSGGSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | TCOPREDADOGSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | TCOPREDIAR2GSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | TCOPREDIAR3GSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | TCOPREDIARIOGSM | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | TCORESPREGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | TCOVIVODIAGSM   | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | TCOVIVONOITEGSM | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | TCOVIVOTODAGSM  | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | VIVODIAGSM      | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | VIVONOITEGSM    | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_ACC_STATE_VALIDATION | <SERVICE> | VIVOTODAGSM     | <ACC_STATE> | <SRV_OPERATION> |      7      |  1  |  

  Exemplos:
  | testcase | SERVICE         | SRV_OPERATION | ACC_STATE |
  | TC-0001  | CAD_ALARM_VT19  |      ACT      |     2     |  
  | TC-0002  | CAD_ALARM_VT19  |      DES      |     3     |  
  | TC-0003  | CAD_ALARM_VT19  |      DES      |     2     |  
  | TC-0004  | CAD_ALARM_VT19  |      DES      |     12    |    
  | TC-0005  | CAD_ALARM_VT19  |      ACT      |     12    |  
  | TC-0006  | CAD_ALARM_VT19  |      ACT      |     3     |  

  | TC-0007  | SRV_ACT_RF_VT19 |      DES      |     2     |    
  | TC-0008  | SRV_ACT_RF_VT19 |      ACT      |     3     |    
  | TC-0009  | SRV_ACT_RF_VT19 |      DES      |     1     |    
  | TC-0010  | SRV_ACT_RF_VT19 |      ACT      |     2     |    
  | TC-0011  | SRV_ACT_RF_VT19 |      DES      |     3     |    
  | TC-0012  | SRV_ACT_RF_VT19 |      ACT      |     1     |    
  | TC-0013  | SRV_ACT_RF_VT19 |      DES      |     12    |    
  | TC-0014  | SRV_ACT_RF_VT19 |      ACT      |     12    |    

  | TC-0015  | SRV_TARIFA_VT19 |      DES      |     2     |    
  | TC-0016  | SRV_TARIFA_VT19 |      DES      |     1     |    
  | TC-0017  | SRV_TARIFA_VT19 |      DES      |     12    |    
  | TC-0018  | SRV_TARIFA_VT19 |      ACT      |     2     |    
  | TC-0019  | SRV_TARIFA_VT19 |      ACT      |     12    |    
  | TC-0020  | SRV_TARIFA_VT19 |      DES      |     3     |    
  | TC-0021  | SRV_TARIFA_VT19 |      SUS      |     12    |    
  | TC-0022  | SRV_TARIFA_VT19 |      SUS      |     3     |    
  | TC-0023  | SRV_TARIFA_VT19 |      SUS      |     2     |    
  | TC-0024  | SRV_TARIFA_VT19 |      ACT      |     3     |    
  | TC-0025  | SRV_TARIFA_VT19 |      ACT      |     1     |    
  | TC-0026  | SRV_TARIFA_VT19 |      SUS      |     1     |    

  | TC-0027  | CCA_CAD_884     |      ACT      |     2     |  
  | TC-0028  | CCA_CAD_884     |      ACT      |     3     |  
  | TC-0029  | CCA_CAD_884     |      ACT      |     12    |  
  | TC-0030  | CCA_CAD_884     |      DES      |     2     |    
  | TC-0031  | CCA_CAD_884     |      DES      |     3     |  
  | TC-0032  | CCA_CAD_884     |      DES      |     12    |  

  | TC-0033  | PCK_VT_CMB_884  |      ACT      |     1     |    
  | TC-0034  | PCK_VT_CMB_884  |      ACT      |     2     |    
  | TC-0035  | PCK_VT_CMB_884  |      ACT      |     3     |    
  | TC-0036  | PCK_VT_CMB_884  |      ACT      |     12    |    
  | TC-0037  | PCK_VT_CMB_884  |      DES      |     1     |    
  | TC-0038  | PCK_VT_CMB_884  |      DES      |     2     |    
  | TC-0039  | PCK_VT_CMB_884  |      DES      |     3     |    
  | TC-0040  | PCK_VT_CMB_884  |      DES      |     12    |  

  | TC-0041  | PCT_CMB_VT19MSL |      ACT      |     1     |    
  | TC-0042  | PCT_CMB_VT19MSL |      SUS      |     1     |    
  | TC-0043  | PCT_CMB_VT19MSL |      DES      |     1     |    
  | TC-0044  | PCT_CMB_VT19MSL |      ACT      |     2     |    
  | TC-0045  | PCT_CMB_VT19MSL |      DES      |     2     |    
  | TC-0046  | PCT_CMB_VT19MSL |      SUS      |     2     |    
  | TC-0047  | PCT_CMB_VT19MSL |      SUS      |     3     |    
  | TC-0048  | PCT_CMB_VT19MSL |      DES      |     3     |    
  | TC-0049  | PCT_CMB_VT19MSL |      ACT      |     3     |    
  | TC-0050  | PCT_CMB_VT19MSL |      SUS      |     12    |    
  | TC-0051  | PCT_CMB_VT19MSL |      DES      |     12    |    
  | TC-0052  | PCT_CMB_VT19MSL |      ACT      |     12    | 

  | TC-0053  | PCT_CMB_VT19DEG |      SUS      |     1     |    
  | TC-0054  | PCT_CMB_VT19DEG |      ACT      |     1     |    
  | TC-0055  | PCT_CMB_VT19DEG |      DES      |     1     |    
  | TC-0056  | PCT_CMB_VT19DEG |      ACT      |     2     |    
  | TC-0057  | PCT_CMB_VT19DEG |      SUS      |     2     |    
  | TC-0058  | PCT_CMB_VT19DEG |      DES      |     2     |    
  | TC-0059  | PCT_CMB_VT19DEG |      SUS      |     3     |    
  | TC-0060  | PCT_CMB_VT19DEG |      ACT      |     3     |    
  | TC-0061  | PCT_CMB_VT19DEG |      DES      |     3     |    
  | TC-0062  | PCT_CMB_VT19DEG |      SUS      |     12    |    
  | TC-0063  | PCT_CMB_VT19DEG |      ACT      |     12    |    
  | TC-0064  | PCT_CMB_VT19DEG |      DES      |     12    | 





@Banco @ID-0023 @life_cycle
  Esquema do Cenario: Validar convivência dos planos com a VT 884 na SRV_CFG_INTERFACE_PARAM  
  Dado o número do caso de teste "<testcase>"
  Então valido a consulta com os parametros:
  | TIPO   | BASE | TABELA                  | SERVICE   | PROFILE         | PARAMETER   | INTERFACE_ID   | PARAMETER_VALUE     | QTD |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJALTOVAL1GSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJVIVONOITEGSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSPREDIAR3GSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSNOITEGSM      | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | TCOMAISMSGGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | TCOPREDADOGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | TCOPREDIAR3GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRPREDIARIOGSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | LIVREMTVGSM     | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | LIVREGSM        | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | NERESPREGSM     | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRBASICOGSM     | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJTODAGSM       | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSALTOVAL1GSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSPREDIAR2GSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | SPMAISMSGGSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | SPALTOVAL1GSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | TCORESPREGSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | TCOPREDIARIOGSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | VIVONOITEGSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJVIVODIAGSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | BAALTOVAL1GSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | GOLGSM          | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | BASICOGSM       | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGVIVONOITEGSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGALTOVAL1GSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGFLEX45GSM     | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRLIVREGSM      | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSBASICOGSM     | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJNOITEGSM      | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSPREDADOGSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSRESPREGSM     | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | SPPREDIAR2GSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | TCOVIVONOITEGSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGPREDIARIOGSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGPREDIAR3GSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | VIVOTODAGSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | BAVIVOTODAGSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | BARESPREGSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | NEALTOVAL2GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | NEVIVODIAGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | NEVIVONOITEGSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | NEPREDADOGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJDIAGSM       | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSALTOVAL2GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJMAISMSGGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJRESPREGSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSPREDIARIOGSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJPREDIARIOGSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | NEPREDIAR2GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRPREDIAR2GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | JOVEMGSM       | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGVIVOTODAGSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGALTOVAL2GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | NEALTOVAL1GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGFLEX85GSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGCTRLEMPGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRALTOVAL2GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRLIVRE1GSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJALTOVAL2GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRMAISMSGGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJPREDADOGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | SPALTOVAL2GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | SPPREDADOGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | TCOALTOVAL2GSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | BADIAGSM       | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | BAPREDIAR2GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | BAPREDIARIOGSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | BAVIVODIAGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGPREDADOGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGMAISMSGGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRJOVEMGSM     | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRRESPREGSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | BAVIVONOITEGSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | LIVREGOSPELGSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGNOITEGSM     | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGRESPREGSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGVIVODIAGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRALTOVAL1GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | NEMAISMSGGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRVIVOTODAGSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJPREDIAR3GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSVIVODIAGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSMAISMSGGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | TCOVIVODIAGSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | TCOVIVOTODAGSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | TCOLIVREGSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | BAALTOVAL2GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGCONTROLGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | NEVIVOTODAGSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRVIVONOITEGSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRPREDIAR3GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJBASICOGSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRPREDADOGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJVIVOTODAGSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RJPREDIAR2GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSVIVONOITEGSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSVIVOTODAGSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | SPRESPREGSM    | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | TCOPREDIAR2GSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | VIVODIAGSM     | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | BAMAISMSGGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | MGPREDIAR2GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | BAPREDADOGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | BAPREDIAR3GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | NEPREDIARIOGSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | NEPREDIAR3GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | PRVIVODIAGSM   | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSTODAGSM      | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | RSDIAGSM       | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | TCOALTOVAL1GSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | SPPREDIAR3GSM  | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PARAM | <SERVICE> | SPPREDIARIOGSM | <PARAMETER> | <INTERFACE_ID> | LIST(NEW_MSISDN)    |  1  | 

  Exemplos:
  | testcase | SERVICE         | PARAMETER | INTERFACE_ID      |
  | TC-0001  | PCT_CMB_VT19MSL | MSISDN    | CHANGE_MSISDN_BEF |  
  | TC-0002  | PCT_CMB_VT19DEG | MSISDN    | CHANGE_MSISDN_BEF |




@Banco @ID-0024 @life_cycle
  Esquema do Cenario:   Validar VT 884 - tabela SRV_CFG_INTERFACE_PERMISSION
  # template de apoio: PrePago_T86009_CFG559500_Pacotes_YouTube_4GB_20.2.0 (ABA: MEIOS_CONTRATACAO )

  Dado o número do caso de teste "<testcase>"
  Então valido a consulta com os parametros:
  | TIPO   | BASE | TABELA                       | SERVICE   | PROFILE         | INTERFACE   | OPERATION   | CLIENT_TYPE | QTD |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | BAALTOVAL1GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | BAALTOVAL2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | BADIAGSM        | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | BAMAISMSGGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | BAPREDADOGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | BAPREDIAR2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | BAPREDIAR3GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | BAPREDIARIOGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | BARESPREGSM     | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | BASICOGSM       | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | BAVIVODIAGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | BAVIVONOITEGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | BAVIVOTODAGSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | GOLGSM          | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | JOVEMGSM        | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | LIVREGOSPELGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | LIVREGSM        | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | LIVREMTVGSM     | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGALTOVAL1GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGALTOVAL2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGCONTROLGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGCTRLEMPGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGFLEX45GSM     | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGFLEX85GSM     | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGMAISMSGGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGNOITEGSM      | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGPREDADOGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGPREDIAR2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGPREDIAR3GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGPREDIARIOGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGRESPREGSM     | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGVIVODIAGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGVIVONOITEGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | MGVIVOTODAGSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | NEALTOVAL1GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | NEALTOVAL2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | NEMAISMSGGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | NEPREDADOGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | NEPREDIAR2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | NEPREDIAR3GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | NEPREDIARIOGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | NERESPREGSM     | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | NEVIVODIAGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | NEVIVONOITEGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | NEVIVOTODAGSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRALTOVAL1GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRALTOVAL2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRBASICOGSM     | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRJOVEMGSM      | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRLIVRE1GSM     | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRLIVREGSM      | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRMAISMSGGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRPREDADOGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRPREDIAR2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRPREDIAR3GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRPREDIARIOGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRRESPREGSM     | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRVIVODIAGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRVIVONOITEGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | PRVIVOTODAGSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJALTOVAL1GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJALTOVAL2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJBASICOGSM     | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJDIAGSM        | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJMAISMSGGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJNOITEGSM      | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJPREDADOGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJPREDIAR2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJPREDIAR3GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJPREDIARIOGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJRESPREGSM     | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJTODAGSM       | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJVIVODIAGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJVIVONOITEGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RJVIVOTODAGSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSALTOVAL1GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSALTOVAL2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSBASICOGSM     | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSDIAGSM        | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSMAISMSGGSM    | <INTERFACE> | <OPERATION> |      7      |  1  | 
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSNOITEGSM      | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSPREDADOGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSPREDIAR2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSPREDIAR3GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSPREDIARIOGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSRESPREGSM     | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSTODAGSM       | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSVIVODIAGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSVIVONOITEGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | RSVIVOTODAGSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | SPALTOVAL1GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | SPALTOVAL2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | SPMAISMSGGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | SPPREDADOGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | SPPREDIAR2GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | SPPREDIAR3GSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | SPPREDIARIOGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | SPRESPREGSM     | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | TCOALTOVAL1GSM  | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | TCOALTOVAL2GSM  | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | TCOLIVREGSM     | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | TCOMAISMSGGSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | TCOPREDADOGSM   | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | TCOPREDIAR2GSM  | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | TCOPREDIAR3GSM  | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | TCOPREDIARIOGSM | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | TCORESPREGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | TCOVIVODIAGSM   | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | TCOVIVONOITEGSM | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | TCOVIVOTODAGSM  | <INTERFACE> | <OPERATION> |      7      |  1  |
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | VIVODIAGSM      | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | VIVONOITEGSM    | <INTERFACE> | <OPERATION> |      7      |  1  |  
  | SELECT | BDA  | SRV_CFG_INTERFACE_PERMISSION | <SERVICE> | VIVOTODAGSM     | <INTERFACE> | <OPERATION> |      7      |  1  |  

  Exemplos:
  | testcase | SERVICE        | INTERFACE | OPERATION | 
  | TC-0001  | CAD_ALARM_VT19 | CAR        | GTS       |      
  | TC-0002  | CAD_ALARM_VT19 | MED        | GTS       |      
  | TC-0003  | CAD_ALARM_VT19 | UIB        | DES       |      
  | TC-0004  | CAD_ALARM_VT19 | VIVO360    | GTS       |      
  | TC-0005  | CAD_ALARM_VT19 | HADA       | GTS       |  

  | TC-0006  | SRV_TARIFA_VT19 | VIVO360   | GTS       |      
  | TC-0007  | SRV_TARIFA_VT19 | CAR       | DES       |      
  | TC-0008  | SRV_TARIFA_VT19 | HADA      | GTS       |      
  | TC-0009  | SRV_TARIFA_VT19 | UIB       | DES       |      
  
  | TC-0010  | SRV_ACT_RF_VT19 | VIVO360   | GTS       |      
  | TC-0011  | SRV_ACT_RF_VT19 | CAR       | GTS       |      
  | TC-0012  | SRV_ACT_RF_VT19 | HADA      | GTS       |      
  | TC-0013  | SRV_ACT_RF_VT19 | UIB       | DES       |      
  
  | TC-0014  | CCA_CAD_884     | CAR       | GTS       |      
  | TC-0015  | CCA_CAD_884     | MED       | GTS       |      
  | TC-0016  | CCA_CAD_884     | UIB       | DES       |      
  | TC-0017  | CCA_CAD_884     | VIVO360   | GTS       |      
  
  | TC-0018  | PCK_VT_CMB_884  | CAR       | GTS       |      
  | TC-0019  | PCK_VT_CMB_884  | UIB       | GTS       |      
   
  | TC-0020  | PCT_CMB_VT19MSL | CAR       | GTS       |      
  | TC-0021  | PCT_CMB_VT19MSL | UIB       | DES       |      
  | TC-0022  | PCT_CMB_VT19MSL | VIVO360   | GTS       |      
  
  | TC-0023  | PCT_CMB_VT19DEG | CAR       | GTS       |      
  | TC-0024  | PCT_CMB_VT19DEG | UIB       | DES       |      
  | TC-0025  | PCT_CMB_VT19DEG | VIVO360   | GTS       |

  | TC-0026  | SRV_SVA_PRE11   | HADA      | GTS       |




@Banco @ID-0025 @life_cycle
  Esquema do Cenario: Validar VT 884 - tabela SRV_CFG_INTERFACE_RQST  
  Dado o número do caso de teste "<testcase>"
  Então valido a consulta com os parametros:
  | TIPO   | BASE | TABELA                 | SERVICE   | PARAM_KEY3  | OPERATION       | CLIENT_TYPE | PRIORITY | INTERFACE_ID  | QTD |
  | SELECT | BDA  | SRV_CFG_INTERFACE_RQST | <SERVICE> | <ACC_STATE> | <SRV_OPERATION> |      7      |   1000   | CHANGE_STATUS |  1  |

  Exemplos:
  | testcase | SERVICE         | SRV_OPERATION | ACC_STATE |
  | TC-0001  | SRV_ACT_RF_VT19  |      DES      |    51    |  
  | TC-0002  | SRV_ACT_RF_VT19  |      DES      |    7     |  
  | TC-0003  | SRV_ACT_RF_VT19  |      DES      |    8     |  
  | TC-0004  | SRV_ACT_RF_VT19  |      DES      |    9     | 
  | TC-0004  | SRV_ACT_RF_VT19  |      DES      |    46    |

  | TC-0001  | PCK_VT_CMB_884   |      DES      |    51    |  
  | TC-0002  | PCK_VT_CMB_884   |      DES      |    7     |  
  | TC-0003  | PCK_VT_CMB_884   |      DES      |    8     |  
  | TC-0004  | PCK_VT_CMB_884   |      DES      |    9     | 
  | TC-0004  | PCK_VT_CMB_884   |      DES      |    46    |

  | TC-0001  | SRV_SVA_PRE11   |      DES      |     51    |  
  | TC-0002  | SRV_SVA_PRE11   |      DES      |     7     |  
  | TC-0003  | SRV_SVA_PRE11   |      DES      |     8     |  
  | TC-0004  | SRV_SVA_PRE11   |      DES      |     9     | 
  | TC-0004  | SRV_SVA_PRE11   |      DES      |     46    |

  | TC-0001  | CAD_ALARM_VT19  |      DES      |     7     |  
  | TC-0002  | CAD_ALARM_VT19  |      DES      |     9     |  
  | TC-0003  | CAD_ALARM_VT19  |      DES      |     8     |  
  | TC-0004  | CAD_ALARM_VT19  |      DES      |     46    | 
   
  | TC-0001  | SRV_TARIFA_VT19  |      DES      |    7     |  
  | TC-0002  | SRV_TARIFA_VT19  |      DES      |    9     |  
  | TC-0003  | SRV_TARIFA_VT19  |      DES      |    8     |  
  | TC-0004  | SRV_TARIFA_VT19  |      DES      |    46    |

  | TC-0001  | CCA_CAD_884      |      DES      |    7     |  
  | TC-0002  | CCA_CAD_884      |      DES      |    9     |  
  | TC-0003  | CCA_CAD_884      |      DES      |    8     |  
  | TC-0004  | CCA_CAD_884      |      DES      |    46    |  

  | TC-0001  | PCT_CMB_VT19MSL  |      RMV      |    7     |  
  | TC-0002  | PCT_CMB_VT19MSL  |      RMV      |    8     |  
  | TC-0003  | PCT_CMB_VT19MSL  |      RMV      |    9     |  
  | TC-0004  | PCT_CMB_VT19MSL  |      RMV      |    46    |  

  | TC-0001  | PCT_CMB_VT19DEG  |      DES      |    7     |  
  | TC-0002  | PCT_CMB_VT19DEG  |      DES      |    8     |  
  | TC-0003  | PCT_CMB_VT19DEG  |      DES      |    9     |  
  | TC-0004  | PCT_CMB_VT19DEG  |      DES      |    46    |




@Banco @ID-0026 @promotion 
  Esquema do Cenario: Validar VT 884 - tabela SRV_CFG_NOTIFICATION (pacote promo)
  Dado o número do caso de teste "<testcase>"
  ##Template de apoio: Extract 875 e 865 v1
  ## exclusão de sms's
  Então valido a consulta com os parametros:
    | TIPO   | BASE | TABELA                 | SERVICE         | CLIENT_TYPE  | PROFILE |PROFILE_AREA_GROUP | SRV_EVENT | DAYS_INTERVAL | NOTIFICATION_ID      | QTD  |
    | SELECT | BDA  | SRV_CFG_NOTIFICATION   | SRV_TARIFA_VT19 | 7            |    *    |  VT19_GRP_N       | EXP       | 1792          | SMS_TRFRDZVT19_01_GN | -1   |
    | SELECT | BDA  | SRV_CFG_NOTIFICATION   | SRV_TARIFA_VT19 | 7            |    *    |  VT19_GRP_N       | EXP       | 1             | SMS_TRFRDZVT19_02_GN | -1   |
    | SELECT | BDA  | SRV_CFG_NOTIFICATION   | SRV_FLAG_CMB_VT | 7            |    *    |  VT19_GRP_N       | ACT       | 0             | SMS_ACT_FLAGCMBVTGN  | -1   |

  Então valido a consulta com os parametros:
    | TIPO   | BASE | TABELA                 | SERVICE         | CLIENT_TYPE  | PROFILE | PROFILE_AREA_GROUP | SRV_EVENT | NOTIFICATION_ID     | QTD  |
    | SELECT | BDA  | SRV_CFG_NOTIFICATION   | SRV_ACT_RF_VT19 | 7            |    *    |  GRP_RFSH_1_SRV    | ACT       | SMS_ACT_REFSH_VT19  | -1   |

  Então valido a consulta com os parametros:
    | BASE | TIPO   | TABELA               | SERVICE   | SRV_EVENT | NOTIFICATION_ID |  DAYS_INTERVAL | PROFILE_AREA_GROUP | QTD |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_01_GN |        0       | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_02_GN |        0       | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_03_GN |        0       | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_04_GN |        0       | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_05_GN |        5       | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_06_GN |        10      | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_07_GN |        15      | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_08_GN |        20      | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_09_GN |        25      | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_10_GN |        30      | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_11_GN |        35      | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_12_GN |        40      | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_13_GN |        45      | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_14_GN |        50      | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_15_GN |        55      | VT19_GRP_N         |  1  |   
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_16_GN |        60      | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_17_GN |        75      | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_18_GN |        90      | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    DES    | PACK_VT19_19_GN |        0       | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_21_GN |        0       | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    EXP    | PACK_VT19_22_GN |        0       | VT19_GRP_N         |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    RVL    | PACK_VT19_23_GN |        4       | VT19_GRP_N         |  1  |

    Exemplos:
      | testcase | SERVICE         |
      | TC-0001  | PCT_CMB_VT19MSL |





@Banco @ID-0027 @promotion 
  Esquema do Cenario: Validar VT 884 - tabela SRV_CFG_NOTIFICATION (pacote degustação) 
  Dado o número do caso de teste "<testcase>"
  ##Template de apoio: Extract 875 e 865 v1
  ## exclusão de sms's
  Então valido a consulta com os parametros:
    | BASE | TIPO   | TABELA               | SERVICE   | SRV_EVENT | NOTIFICATION_ID   | PROFILE_AREA_GROUP | QTD |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    EXP    | VT19INCPOSDEG14GN |  VT19_GRP_N        |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    EXP    | VT19INCPOSDEG15GN |  VT19_GRP_N        |  1  |
    | BDA  | SELECT | SRV_CFG_NOTIFICATION | <SERVICE> |    EXP    | PACK_VT19_22_GN   |  VT19_GRP_N        |  1  |

    Exemplos:
      | testcase | SERVICE         |
      | TC-0001  | PCT_CMB_VT19DEG |






@Banco @ID-0028 @promotion 
  Esquema do Cenario: Validar VT 884 - tabela PRV_SMS_MESSAGE_TYPE, CRM_SMS_NOTIF_CLASS (BOP)
  Dado o número do caso de teste "<testcase>"
   # SMS de degustação teve alteração de 15 dias para 60
   # Templates PrePago_T86009_CFG563830_Pacotes_884_20.2.1 / PrePago_T86008_CFG563824_Servicos_884_20.2.0 / PrePago_T474595_CFG563845_StepsVivoTurbo_AlavancagemStepDown_20.2.1 
  Então valido a consulta com os parametros:
    | BASE | TIPO   | TABELA               | CODE    |  TEXT   |QTD |
    | BDA  | SELECT | PRV_SMS_MESSAGE_TYPE | <CODE>  | <TEXT>  | 1  |
  Então valido a consulta com os parametros:
    | TIPO   | BASE | TABELA           |  SMS_CODE  |  TELCO  | START_TIME  | END_TIME   |  QTD  |
    | SELECT | BDA  | PRV_SMS_SCHEDULE |   <CODE>   |    1    | % 09:00:00  | % 21:00:00 |   57  |
    | SELECT | BDA  | PRV_SMS_SCHEDULE |   <CODE>   |    2    | % 09:00:00  | % 21:00:00 |   57  |
    | SELECT | BDA  | PRV_SMS_SCHEDULE |   <CODE>   |    3    | % 09:00:00  | % 21:00:00 |   57  |
    | SELECT | BDA  | PRV_SMS_SCHEDULE |   <CODE>   |    4    | % 09:00:00  | % 21:00:00 |   57  |
    | SELECT | BDA  | PRV_SMS_SCHEDULE |   <CODE>   |    5    | % 09:00:00  | % 21:00:00 |   57  |
    | SELECT | BDA  | PRV_SMS_SCHEDULE |   <CODE>   |    6    | % 09:00:00  | % 21:00:00 |   57  |
    | SELECT | BDA  | PRV_SMS_SCHEDULE |   <CODE>   |    7    | % 09:00:00  | % 21:00:00 |   57  |
    | SELECT | BDA  | PRV_SMS_SCHEDULE |   <CODE>   |    8    | % 09:00:00  | % 21:00:00 |   57  |
  E valido a consulta com os parametros:
    | TIPO   | BASE | TABELA               | SMS_CODE | QTD |
    | SELECT | BDA  | CRM_SMS_NOTIF_CLASS  | <CODE>   |  1  |

  Exemplos:
    | testcase | CODE                 | NAME                                              | TEXT                                                                                                                                                            |
    | TC-0001  | SMS_TRFRDZVT19_01_GN | Incentivo no dia - VT19_GRP_N                     | Sua promocao ainda nao foi renovada. Para voltar a usar Vivo Turbo basta ter R$17 de saldo. Acesse gratis vivo.com.br/recarga                                   |
    | TC-0002  | SMS_TRFRDZVT19_02_GN | SMS do 2 dia de Tarifa - VT9_GRP_N                | Sua promocao ainda nao foi renovada. Para voltar a usar Vivo Turbo basta ter R$17 de saldo. Acesse gratis vivo.com.br/recarga                                   |
    | TC-0003  | SMS_ACT_FLAGCMBVTGN  | Bonus INTERNET em DOBRO - Ini Per Conces Bonus GN | Giga Chip: voce ganhou 15 dias de Vivo Pre + Internet em DOBRO por 6 meses! De hoje ate  ${SRV_EXP_DATE}, tenha o DOBRO de internet quando renovar sua promocao |
    | TC-0004  | SMS_ACT_REFSH_VT19   | Contratacao com sucesso do VT BIS 15 DIAS         | Sua promocao Vivo Turbo foi renovada com sucesso. Voce tera ${SRV_MOVED_VALUE} que nao usou no periodo anterior para aproveitar por mais 15 dias.               |
    | TC-0005  | PACK_VT19_01_GN      | Revalidacao com Sucesso - VT19GN                  | Sua Vivo Turbo foi renovada por R$17/15 dias: 5GB + ligacoes ILIMITADAS p/ qlqr operadora + WhatsApp + Skeelo Light, GoRead e Vivo Recado                       |
    | TC-0006  | PACK_VT19_02_GN      | Incentivo 02 dias antes - VT19GN                  | Voce sabia que a recarga de R$17 e ideal para aproveitar a internet e WhatsApp do seu pre por mais tempo? Recarregue e renove sua promocao em 2 dias            |
    | TC-0007  | PACK_VT19_03_GN      | Incentivo no dia da revalidacao - VT19GN          | Sua promocao ainda nao foi renovada. Para voltar a usar Vivo Turbo basta ter R$17 de saldo. Acesse gratis vivo.com.br/recarga                                   |
    | TC-0008  | PACK_VT19_04_GN      | Suspensao pela Revalidacao sem Sucesso - VT19GN   | Ainda tem internet? Renove sua promocao HOJE e tenha +15 dias p/ usar! Recarregue em https://app.vivo/Recarga ou WhatsApp https://vivo.tl/wrecarga              |
    | TC-0009  | PACK_VT19_05_GN      | Incentivo apos suspensao (5 dias) - VT19GN        | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0010  | PACK_VT19_06_GN      | Incentivo apos suspensao (10 dias) - VT19GN       | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0011  | PACK_VT19_07_GN      | Incentivo apos suspensao (15 dias) - VT19GN       | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0012  | PACK_VT19_08_GN      | Incentivo apos suspensao (20 dias) - VT19GN       | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0013  | PACK_VT19_09_GN      | Incentivo apos suspensao (25 dias) - VT19GN       | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0014  | PACK_VT19_10_GN      | Incentivo apos suspensao (30 dias) - VT19GN       | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0015  | PACK_VT19_11_GN      | Incentivo apos suspensao (35 dias) - VT19GN       | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0016  | PACK_VT19_12_GN      | Incentivo apos suspensao (40 dias) - VT19GN       | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0017  | PACK_VT19_13_GN      | Incentivo apos suspensao (45 dias) - VT19GN       | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0018  | PACK_VT19_14_GN      | Incentivo apos suspensao (50 dias) - VT19GN       | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0019  | PACK_VT19_15_GN      | Incentivo apos suspensao (55 dias) - VT19GN       | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0020  | PACK_VT19_16_GN      | Incentivo apos suspensao (60 dias) - VT19GN       | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0021  | PACK_VT19_17_GN      | Incentivo apos suspensao (75 dias) - VT19GN       | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0022  | PACK_VT19_18_GN      | Incentivo apos suspensao (90 dias) - VT19GN       | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0023  | PACK_VT19_19_GN      | Desativacao Pacote - VT19GN                       | Quer voltar a ter WhatsApp ilimitado por 15 dias? Recarregue e renove a Vivo Turbo. WhatsApp: https://vivo.tl/wrecarga ou acesse https://app.vivo/Recarga       |
    | TC-0024  | PACK_VT19_21_GN      | Incentivo 1 dia antes - VT19GN                    | Vc tem ate amanha para usar os beneficios da Vivo Turbo. Conheca outras opcoes no app Vivo https://app.vivo/VivoTurbo ou WhatsApp https://vivo.tl/wpromo        |
    | TC-0025  | PACK_VT19_22_GN      | Expiracao Pacote Degustacao - VT19GN              | Seus 60 dias de Vivo Pre Turbo acabaram! Responda com a palavra TURBO, escolha sua promocao e aproveite internet + ligacoes + WhatsApp ilimitado                |
    | TC-0026  | PACK_VT19_23_GN      | Incentivo apos suspensao (4 dias) - VT19GN        | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue https://app.vivo/Recarga ou https://vivo.tl/wrecarga            |
    | TC-0027  | VTUDATVPCTB_V19GN    | Vivo Turbo - Ativa tarifa reduzida                | Vivo Pre Turbo 15 DIAS: Servicos digitais Skeelo Light, GoRead e Vivo Recado inclusos! Saiba mais em vivo.com.br/pre                                            |
    | TC-0028  | VTUDATVPCT_V19GN     | Vivo Turbo - Ativa Pacote Quinzenal               | Vivo Pre Turbo 15 dias ativada com sucesso. Vc tem 5GB de internet + ligacoes ILIMITADAS p/ qlqr operadora + WhatsApp por 15 dias. Aproveite!                   |
    | TC-0029  | PCK_VT_CMB_884_3     | Vivo Turbo - Ativa Giga Chip                      | Vivo Pre Turbo 15 dias ativada com sucesso. Vc tem 5GB de internet + ligacoes ILIMITADAS p/ qlqr operadora + WhatsApp por 15 dias. Aproveite!                   |
    | TC-0030  | VTUDCADTAV19GN       | Vivo Turbo - Cadastro Massivo TAG                 | Recarregue R$35 e tenha o Vivo Pre Turbo SEM GASTAR CREDITO! 5GB + ligacoes ilimitadas p/ qlqr operadora + WhatsApp ilimitado por 15 dias                       |
    | TC-0031  | VTUDCAD_V19GN        | Vivo Turbo - Cadastro                             | Voce possui oferta cadastrada, porem o saldo esta abaixo de R$17. Recarregue e aproveite 5GB e ligacoes ilimitadas p/ qualquer operadora por 15 dias            |
    | TC-0032  | VTUDFIMCADANT1_V19GN | Vivo Turbo - Estimulo 1 dia antes fim cadast      | Vivo Turbo: saldo abaixo de R$17. Recarregue e ative: 5GB + ligacoes ilimitadas p/ qlqr operadora + WhatsApp ilimitado p/ msg, video e foto.                    |
    | TC-0033  | VTUDJACAD_V19GN      | Vivo Turbo - Ja cadastrado na promocao            | Vivo Turbo: saldo abaixo de R$17. Recarregue e ative o Vivo Turbo: 5GB + ligacoes ilimitadas p/ qlqr operadora e WhatsApp.                                      |
    | TC-0034  | VTUDPATPRM_V19GN     | Vivo Turbo - Pre Ativa promo                      | Recarregue para comecar a usar seus 15 dias GRATIS! Voce tem 5GB (+5GB de BONUS) + ligacoes Ilimitadas p/ qlqr operadora + WhatsApp ilimitado!                  |
    | TC-0035  | VTUDPREATIV_V19GN    | Vivo Turbo - Pre-ativa                            | Vivo Pre Turbo: saldo abaixo de R$17. Recarregue e ative: 5GB + lig ilimitadas p/ qlqr operadora + WhatsApp                                                     |
    | TC-0036  | VTUDRVLPCT_V19GN     | Antecipacao da Renovacao com Sucesso              | Vivo Pre Turbo 15 dias renovada com sucesso. Vc tem 5GB de internet + ligacoes ILIMITADAS p/qlqr operadora + SMS ilimitado por 15 dias. Aproveite!              |
    | TC-0037  | VTU884ANTRVLNOK_GRPN | Falha antecipacao renovacao Promo 884             | Vivo Turbo: promocao Vivo Turbo 15 DIAS nao foi renovada, saldo abaixo de R$17. Recarregue e em seguida envie ANTECIPE p/ 9003                                  |
    | TC-0038  | VT19ATVPCTREABGRPN   | VT884 - Ativacao do pacote Gratuito               | Voce recarregou e tem 60 dias gratis da promocao Vivo Turbo R$17. Use 5GB + WhatsApp ilimitado p/ mensagem, video e foto.                                       |
    | TC-0039  | VT19ATVSRVREABGRPN   | VT884 - Ativacao do servico Gratuito              | Voce pode usar por 60 dias os beneficios do Vivo Turbo 15D. Ligacoes, internet, WhatsApp, Skeelo Light, GoRead e Vivo Recado. Aproveite!                        |
    | TC-0040  | VT19DESTROC_GRPN     | Vivo Turbo - Desativacao Troca                    | Seu cadastro no Vivo Turbo 15 DIAS expirou. Responda com a palavra TURBO e garanta uma promocao para economizar com seu Pre                                     |
    | TC-0041  | PCK_VT_CMB_884_1     | VT884 - 14 dias apos ativação Giga Chip           | Os primeiros 15 dias da Vivo Turbo terminam AMANHA.Tenha R$17 de saldo e renove por 15 dias: 5GB + WhatsApp + LIGACOES ILIMITADAS usando o codigo 15            |
    | TC-0042  | PCK_VT_CMB_884_2     | VT884 - 15 dias apos ativação Giga Chip           | A partir de AMANHA, com R$17 a cada 15 dias, tenha 5GB (+5GB de BONUS) + WhatsApp + LIGACOES ILIMITADAS usando o codigo 15                                      |
    | TC-0043  | VT19INCPOSDEG14GN    | VT884 - Lembrar 14 dias apos desgustacao          | Os 60 dias gratis da Vivo Turbo terminam AMANHA.Tenha R$14,99 de saldo e renove por 15 dias: 4GB + WhatsApp + LIGACOES ILIMITADAS usando o codigo 15            |
    | TC-0044  | VT19INCPOSDEG15GN    | VT884 - Lembrar ultimo dia da desgustacao         | A partir de AMANHA, com R$17 a cada 60 dias, tenha 5GB+WhatsApp+ LIGACOES ILIMITADAS usando o codigo 15. Cancelar: envie DESATIVAR p/ 9003                      |
    | TC-0045  | VTUDINCAPOSCAD2V9GN  | Vivo Turbo - Estimulo 2 dias apos cadastro        | Vivo Turbo: saldo abaixo de R$17. Recarregue e ative: 5GB+ligacoes ilimitadas p/ qualquer operadora+Whatsapp ilimitado p/ msg, video e foto.                    |
    | TC-0046  | VTUDINCAPOSCAD5V9GN  | Vivo Turbo - Estimulo 5 dias apos cadastro        | Ainda nao renovou a Vivo Turbo? P/ garantir a promocao vc precisa ter R$17 de saldo. Recarregue http://vivo.tl/mvpre ou https://vivo.tl/wrecarga                |
    | TC-0047  | VTUDINCAPOSCAD10V9GN | Vivo Turbo - Estimulo 10 dias apos cadastro       | Vivo Turbo: saldo abaixo de R$17. Recarregue e ative: 5GB+ligacoes ilimitadas p/ qualquer operadora+Whatsapp ilimitado p/ msg, video e foto.                    |
    | TC-0048  | VTUDINCAPOSCAD15V9GN | Vivo Turbo - Estimulo 15 dias apos cadastro       | Sua promocao ainda nao foi renovada. Volte a usar Vivo Turbo por R$17. Recarregue no Whatsapp https://vivo.tl/wrecarga ou http://vivo.tl/mvpre                  |
    | TC-0049  | VTUDINCAPOSCAD20V9GN | Vivo Turbo - Estimulo 20 dias apos cadastro       | Vivo Pre Turbo: saldo abaixo de R$17. Recarregue e ative: 5GB+lig ilimitadas p/ qualquer operadora+Whatsapp+min p/ cel outras operadoras                        |
    | TC-0050  | VTUDINCAPOSCAD25V9GN | Vivo Turbo - Estimulo 25 dias apos cadastro       | Recarregue no app Meu Vivo http://vivo.tl/mvpre ou no WhatsApp https://vivo.tl/wrecarga e renove os beneficios da sua promocao Vivo Pre Turbo.                  |
    | TC-0051  | VTUDINCAPOSCAD30V9GN | Vivo Turbo - Estimulo 30 dias apos cadastro       | Vivo Pre Turbo: saldo abaixo de R$17. Recarregue e ative: 5GB+lig ilimitadas p/ qualquer operadora+Whatsapp+min p/ cel outras operadoras                        |
    | TC-0052  | VTUDINCAPOSCAD35V9GN | Vivo Turbo - Estimulo 35 dias apos cadastro       | Recarregue no app Meu Vivo http://vivo.tl/mvpre ou no WhatsApp https://vivo.tl/wrecarga e renove os beneficios da sua promocao Vivo Pre Turbo.                  |
    | TC-0053  | VTUDINCAPOSCAD40V9GN | Vivo Turbo - Estimulo 40 dias apos cadastro       | Vivo Pre Turbo: saldo abaixo de R$17. Recarregue e ative: 5GB+lig ilimitadas p/ qualquer operadora+Whatsapp+min p/ cel outras operadoras                        |
    | TC-0054  | VTUDINCAPOSCAD45V9GN | Vivo Turbo - Estimulo 45 dias apos cadastro       | Recarregue no app Meu Vivo http://vivo.tl/mvpre ou no WhatsApp https://vivo.tl/wrecarga e renove os beneficios da sua promocao Vivo Pre Turbo.                  |
    | TC-0055  | VTUDINCAPOSCAD50V9GN | Vivo Turbo - Estimulo 50 dias apos cadastro       | Vivo Pre Turbo: saldo abaixo de R$17. Recarregue e ative: 5GB+lig ilimitadas p/ qualquer operadora+Whatsapp+min p/ cel outras operadoras                        |
    | TC-0056  | VTUDINCAPOSCAD55V9GN | Vivo Turbo - Estimulo 55 dias apos cadastro       | Sua promocao Vivo Turbo foi renovada com sucesso. Voce tera ${SRV_MOVED_VALUE} que nao usou no perÃ­odo anterior para aproveitar por mais 15 dias.               |
    | TC-0057  | VTUDATIVDEG_V9GN     | Vivo Turbo 15 dias - Ativ Degustacao              | Voce recarregou e ganhou Vivo Turbo por 60 Dias: 5GB internet + ligacoes Ilimitadas para qualquer operadora + Whatsapp e SMS ilimitado. Aproveite!              |






@Banco @ID-0029 @life_cycle
  Esquema do Cenario: Validar reasons de serviços na SRV_CFG_REASON_SERVICE
  # Aba REASONS do template PrePago_T86008_CFG530791_Servicos_SaldoSPO_19.6.0
  Dado o número do caso de teste "<testcase>"
  Então valido a consulta com os parametros:
  | BASE | TIPO   | TABELA                 |  REASON_CODE  | SERVICE   | QTD |
  | BDA  | SELECT | SRV_CFG_REASON_SERVICE |      <CODE>   | <SERVICE> |  1  |

  Exemplos:
  | testcase | CODE | SERVICE        |
  | TC-0001  | 4493 | CAD_ALARM_VT19 |
  | TC-0002  | 4494 | CAD_ALARM_VT19 |
  | TC-0003  | 4495 | CAD_ALARM_VT19 |
  | TC-0004  | 4496 | SRV_TARIFA_VT9 |
  | TC-0005  | 4497 | SRV_TARIFA_VT9 |
  | TC-0006  | 4498 | SRV_TARIFA_VT9 |
  | TC-0007  | 4499 | SRV_TARIFA_VT9 |
  | TC-0008  | 6624 | CCA_CAD_884    |
  | TC-0009  | 6625 | CCA_CAD_884    |
  | TC-0010  | 6626 | CCA_CAD_884    |
  | TC-0011  | 4500 | SRV_ACT_RF_VT19|
  | TC-0012  | 4501 | SRV_ACT_RF_VT19|
  | TC-0013  | 4502 | SRV_ACT_RF_VT19|  
  | TC-0014  | 9455 | PCK_VT_CMB_884 |
  | TC-0015  | 9456 | PCK_VT_CMB_884 |
  | TC-0016  | 9457 | PCK_VT_CMB_884 |  
  | TC-0017  | 6620 | SRV_SVA_PRE11  |
  | TC-0018  | 6621 | SRV_SVA_PRE11  |
  | TC-0019  | 6622 | SRV_SVA_PRE11  |
  | TC-0020  | 6623 | SRV_SVA_PRE11  |
  | TC-0021  | 6552 | PCT_CMB_VT19MSL|
  | TC-0022  | 6553 | PCT_CMB_VT19MSL|
  | TC-0023  | 6554 | PCT_CMB_VT19MSL|
  | TC-0024  | 6555 | PCT_CMB_VT19MSL|
  | TC-0025  | 6556 | PCT_CMB_VT19MSL|
  | TC-0026  | 6557 | PCT_CMB_VT19MSL|
  | TC-0027  | 6558 | PCT_CMB_VT19DEG|
  | TC-0028  | 6559 | PCT_CMB_VT19DEG|
  | TC-0029  | 6560 | PCT_CMB_VT19DEG|
  | TC-0030  | 6561 | PCT_CMB_VT19DEG|
  | TC-0031  | 6562 | PCT_CMB_VT19DEG|
  




@Banco @ID-0030 @life_cycle
  Esquema do Cenario: Validar VT 884 - tabela SRV_COST_OPERATION
      ## não achei template associado para essas informações
      ## Tomei por base a cfg do PACK_YOUTUBE
      ## Mudando somente o debit_reason de acordo com template PrePago_T86009_CFG559500_Pacotes_YouTube_4GB_20.2.0 (ABA:PACOTES )
  Dado o número do caso de teste "<testcase>"
  Então valido a consulta com os parametros:
    | BASE  | TIPO   | TABELA              | SERVICE         | SRV_OPERATION |  DEBIT_REASON  | PROFILE   |  AREA_CODE  | QTD |
    | BDA   | SELECT | SRV_COST_OPERATION  | CAD_ALARM_VT19  |       ACT     |     5576       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | CAD_ALARM_VT19  |       CHG     |     5574       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | CAD_ALARM_VT19  |       DES     |     5575       | <profile> |    <code>   |  1  |

    | BDA   | SELECT | SRV_COST_OPERATION  | SRV_ACT_RF_VT19 |       ACT     |     4500       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | SRV_ACT_RF_VT19 |       CHG     |     4501       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | SRV_ACT_RF_VT19 |       DES     |     4502       | <profile> |    <code>   |  1  |

    | BDA   | SELECT | SRV_COST_OPERATION  | SRV_TARIFA_VT19 |       ACT     |     4496       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | SRV_TARIFA_VT19 |       CHG     |     4497       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | SRV_TARIFA_VT19 |       SUS     |     4498       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | SRV_TARIFA_VT19 |       DES     |     4499       | <profile> |    <code>   |  1  |

    | BDA   | SELECT | SRV_COST_OPERATION  | CCA_CAD_884     |       ACT     |     6624       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | CCA_CAD_884     |       CHG     |     6625       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | CCA_CAD_884     |       DES     |     6626       | <profile> |    <code>   |  1  |

    | BDA   | SELECT | SRV_COST_OPERATION  | SRV_SVA_PRE11   |       ACT     |     6620       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | SRV_SVA_PRE11   |       CHG     |     6621       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | SRV_SVA_PRE11   |       SUS     |     6622       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | SRV_SVA_PRE11   |       DES     |     6623       | <profile> |    <code>   |  1  |

    | BDA   | SELECT | SRV_COST_OPERATION  | PCK_VT_CMB_884  |       ACT     |     9455       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | PCK_VT_CMB_884  |       CHG     |     9456       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | PCK_VT_CMB_884  |       DES     |     9457       | <profile> |    <code>   |  1  |

    | BDA   | SELECT | SRV_COST_OPERATION  | PCT_CMB_VT19MSL |       ACT     |     6553       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | PCT_CMB_VT19MSL |       CHG     |     6554       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | PCT_CMB_VT19MSL |       CHR     |     6555       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | PCT_CMB_VT19MSL |       SUS     |     6556       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | PCT_CMB_VT19MSL |       DES     |     6557       | <profile> |    <code>   |  1  |

    | BDA   | SELECT | SRV_COST_OPERATION  | PCT_CMB_VT19DEG |       ACT     |     6559       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | PCT_CMB_VT19DEG |       SUS     |     6560       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | PCT_CMB_VT19DEG |       DES     |     6561       | <profile> |    <code>   |  1  |
    | BDA   | SELECT | SRV_COST_OPERATION  | PCT_CMB_VT19DEG |       CHG     |     6562       | <profile> |    <code>   |  1  |

Exemplos:
  | testcase| profile        |code|
  # | TC-0001 | BAALTOVAL1GSM  | 74 |
  # | TC-0002 | BAALTOVAL1GSM  | 73 |
  # | TC-0003 | BAALTOVAL1GSM  | 79 |
  # | TC-0004 | BAALTOVAL1GSM  | 75 |
  # | TC-0005 | BAALTOVAL1GSM  | 77 |
  # | TC-0006 | BAALTOVAL1GSM  | 71 |  
  # | TC-0007 | BAALTOVAL2GSM  | 74 |
  # | TC-0008 | BAALTOVAL2GSM  | 79 |
  # | TC-0009 | BAALTOVAL2GSM  | 75 |
  # | TC-0010 | BAALTOVAL2GSM  | 73 |
  # | TC-0011 | BAALTOVAL2GSM  | 71 |
  # | TC-0012 | BAALTOVAL2GSM  | 77 |	  
  # | TC-0013 | BADIAGSM 	     | 77 |
  # | TC-0014 | BADIAGSM 	     | 71 |
  # | TC-0015 | BADIAGSM 	     | 73 |
  # | TC-0016 | BADIAGSM 	     | 74 |
  # | TC-0017 | BADIAGSM 	     | 79 |
  # | TC-0018 | BADIAGSM 	     | 75 |	  
  # | TC-0019 | BAMAISMSGGSM   | 77 |
  # | TC-0020 | BAMAISMSGGSM   | 73 |
  # | TC-0021 | BAMAISMSGGSM   | 75 |
  # | TC-0022 | BAMAISMSGGSM   | 71 |
  # | TC-0023 | BAMAISMSGGSM   | 79 |
  # | TC-0024 | BAMAISMSGGSM   | 74 |	  
  # | TC-0025 | BAPREDADOGSM   | 74 |
  # | TC-0026 | BAPREDADOGSM   | 77 |
  # | TC-0027 | BAPREDADOGSM   | 79 |
  # | TC-0028 | BAPREDADOGSM   | 75 |
  # | TC-0029 | BAPREDADOGSM   | 73 |
  # | TC-0030 | BAPREDADOGSM   | 71 |	  
  # | TC-0031 | BAPREDIARIOGSM | 79 |
  # | TC-0032 | BAPREDIARIOGSM | 73 |
  # | TC-0033 | BAPREDIARIOGSM | 71 |
  # | TC-0034 | BAPREDIARIOGSM | 77 |
  # | TC-0035 | BAPREDIARIOGSM | 75 |
  # | TC-0036 | BAPREDIARIOGSM | 74 |	  
  # | TC-0037 | BAPREDIAR2GSM  | 77 |
  # | TC-0038 | BAPREDIAR2GSM  | 73 |
  # | TC-0039 | BAPREDIAR2GSM  | 74 |
  # | TC-0040 | BAPREDIAR2GSM  | 79 |
  # | TC-0041 | BAPREDIAR2GSM  | 71 |
  # | TC-0042 | BAPREDIAR2GSM  | 75 |
  # | TC-0043 | BAPREDIAR3GSM  | 75 |
  # | TC-0044 | BAPREDIAR3GSM  | 79 |
  # | TC-0045 | BAPREDIAR3GSM  | 71 |
  # | TC-0046 | BAPREDIAR3GSM  | 74 |
  # | TC-0047 | BAPREDIAR3GSM  | 73 |
  # | TC-0048 | BAPREDIAR3GSM  | 77 |
  # | TC-0049 | BARESPREGSM    | 73 |
  # | TC-0050 | BARESPREGSM    | 71 |
  # | TC-0051 | BARESPREGSM    | 79 |
  # | TC-0052 | BARESPREGSM    | 75 |
  # | TC-0053 | BARESPREGSM    | 74 |
  # | TC-0054 | BARESPREGSM    | 77 |
  # | TC-0055 | BASICOGSM 	   | 19 |
  # | TC-0056 | BASICOGSM 	   | 16 |
  # | TC-0057 | BASICOGSM 	   | 14 |
  # | TC-0058 | BASICOGSM 	   | 11 |
  # | TC-0059 | BASICOGSM 	   | 13 |
  # | TC-0060 | BASICOGSM 	   | 18 |
  # | TC-0061 | BASICOGSM 	   | 17 |
  # | TC-0062 | BASICOGSM 	   | 15 |
  # | TC-0063 | BASICOGSM 	   | 12 |
  # | TC-0064 | BAVIVODIAGSM   | 73 |
  # | TC-0065 | BAVIVODIAGSM   | 74 |
  # | TC-0066 | BAVIVODIAGSM   | 71 |
  # | TC-0067 | BAVIVODIAGSM   | 75 |
  # | TC-0068 | BAVIVODIAGSM   | 77 |
  # | TC-0069 | BAVIVODIAGSM   | 79 |
  # | TC-0070 | BAVIVONOITEGSM | 71 |
  # | TC-0071 | BAVIVONOITEGSM | 79 |
  # | TC-0072 | BAVIVONOITEGSM | 74 |
  # | TC-0073 | BAVIVONOITEGSM | 75 |
  # | TC-0074 | BAVIVONOITEGSM | 73 |
  # | TC-0075 | BAVIVONOITEGSM | 77 |
  # | TC-0076 | BAVIVOTODAGSM  | 73 |
  # | TC-0077 | BAVIVOTODAGSM  | 79 |
  # | TC-0078 | BAVIVOTODAGSM  | 77 |
  # | TC-0079 | BAVIVOTODAGSM  | 71 |
  # | TC-0080 | BAVIVOTODAGSM  | 74 |
  # | TC-0081 | BAVIVOTODAGSM  | 75 |
  # | TC-0082 | GOLGSM   	     | 13 |
  # | TC-0083 | GOLGSM   	     | 17 |
  # | TC-0084 | GOLGSM   	     | 15 |
  # | TC-0085 | GOLGSM   	     | 14 |
  # | TC-0086 | GOLGSM   	     | 11 |
  # | TC-0087 | GOLGSM   	     | 19 |
  # | TC-0088 | GOLGSM   	     | 12 |
  # | TC-0089 | GOLGSM   	     | 18 |
  # | TC-0090 | GOLGSM   	     | 16 |
  # | TC-0091 | JOVEMGSM 	     | 16 |
  # | TC-0092 | JOVEMGSM 	     | 13 |
  # | TC-0093 | JOVEMGSM 	     | 15 |
  # | TC-0094 | JOVEMGSM 	     | 17 |
  # | TC-0095 | JOVEMGSM 	     | 18 |
  # | TC-0096 | JOVEMGSM 	     | 14 |
  # | TC-0097 | JOVEMGSM 	     | 11 |
  # | TC-0098 | JOVEMGSM 	     | 12 |
  # | TC-0099 | JOVEMGSM 	     | 19 |
  # | TC-0100 | LIVREGOSPELGSM | 11 |
  | TC-0101 | LIVREGOSPELGSM | 14 |
  | TC-0102 | LIVREGOSPELGSM | 12 |
  | TC-0103 | LIVREGOSPELGSM | 18 |
  | TC-0104 | LIVREGOSPELGSM | 15 |
  | TC-0105 | LIVREGOSPELGSM | 16 |
  | TC-0106 | LIVREGOSPELGSM | 13 |
  | TC-0107 | LIVREGOSPELGSM | 17 |
  | TC-0108 | LIVREGOSPELGSM | 19 |
  | TC-0109 | LIVREGSM 	     | 17 |
  | TC-0110 | LIVREGSM 	     | 12 |
  | TC-0111 | LIVREGSM 	     | 11 |
  | TC-0112 | LIVREGSM 	     | 14 |
  | TC-0113 | LIVREGSM 	     | 16 |
  | TC-0114 | LIVREGSM 	     | 15 |
  | TC-0115 | LIVREGSM 	     | 19 |
  | TC-0116 | LIVREGSM 	     | 18 |
  | TC-0117 | LIVREGSM 	     | 13 |
  | TC-0118 | LIVREMTVGSM    | 15 |
  | TC-0119 | LIVREMTVGSM    | 18 |
  | TC-0120 | LIVREMTVGSM    | 19 |
  | TC-0121 | LIVREMTVGSM    | 11 |
  | TC-0122 | LIVREMTVGSM    | 13 |
  | TC-0123 | LIVREMTVGSM    | 14 |
  | TC-0124 | LIVREMTVGSM    | 16 |
  | TC-0125 | LIVREMTVGSM    | 12 |
  | TC-0126 | LIVREMTVGSM    | 17 |
  | TC-0127 | MGALTOVAL1GSM  | 33 |
  | TC-0128 | MGALTOVAL1GSM  | 32 |
  | TC-0129 | MGALTOVAL1GSM  | 37 |
  | TC-0130 | MGALTOVAL1GSM  | 35 |
  | TC-0131 | MGALTOVAL1GSM  | 34 |
  | TC-0132 | MGALTOVAL1GSM  | 38 |
  | TC-0133 | MGALTOVAL1GSM  | 31 |
  | TC-0134 | MGALTOVAL2GSM  | 31 |
  | TC-0135 | MGALTOVAL2GSM  | 37 |
  | TC-0136 | MGALTOVAL2GSM  | 32 |
  | TC-0137 | MGALTOVAL2GSM  | 33 |
  | TC-0138 | MGALTOVAL2GSM  | 38 |
  | TC-0139 | MGALTOVAL2GSM  | 34 |
  | TC-0140 | MGALTOVAL2GSM  | 35 |
  | TC-0141 | MGCONTROLGSM   | 35 |
  | TC-0142 | MGCONTROLGSM   | 34 |
  | TC-0143 | MGCONTROLGSM   | 32 |
  | TC-0144 | MGCONTROLGSM   | 31 |
  | TC-0145 | MGCONTROLGSM   | 37 |
  | TC-0146 | MGCONTROLGSM   | 33 |
  | TC-0147 | MGCONTROLGSM   | 38 |
  | TC-0148 | MGCTRLEMPGSM   | 35 |
  | TC-0149 | MGCTRLEMPGSM   | 37 |
  | TC-0150 | MGCTRLEMPGSM   | 32 |
  | TC-0151 | MGCTRLEMPGSM   | 31 |
  | TC-0152 | MGCTRLEMPGSM   | 34 |
  | TC-0153 | MGCTRLEMPGSM   | 33 |
  | TC-0154 | MGCTRLEMPGSM   | 38 |
  | TC-0155 | MGFLEX45GSM    | 35 |
  | TC-0156 | MGFLEX45GSM    | 33 |
  | TC-0157 | MGFLEX45GSM    | 34 |
  | TC-0158 | MGFLEX45GSM    | 37 |
  | TC-0159 | MGFLEX45GSM    | 31 |
  | TC-0160 | MGFLEX45GSM    | 32 |
  | TC-0161 | MGFLEX45GSM    | 38 |
  | TC-0162 | MGFLEX85GSM    | 37 |
  | TC-0163 | MGFLEX85GSM    | 32 |
  | TC-0164 | MGFLEX85GSM    | 31 |
  | TC-0165 | MGFLEX85GSM    | 33 |
  | TC-0166 | MGFLEX85GSM    | 35 |
  | TC-0167 | MGFLEX85GSM    | 38 |
  | TC-0168 | MGFLEX85GSM    | 34 |
  | TC-0169 | MGMAISMSGGSM   | 32 |
  | TC-0170 | MGMAISMSGGSM   | 38 |
  | TC-0171 | MGMAISMSGGSM   | 35 |
  | TC-0172 | MGMAISMSGGSM   | 31 |
  | TC-0173 | MGMAISMSGGSM   | 33 |
  | TC-0174 | MGMAISMSGGSM   | 34 |
  | TC-0175 | MGMAISMSGGSM   | 37 |
  | TC-0176 | MGNOITEGSM     | 38 |
  | TC-0177 | MGNOITEGSM     | 35 |
  | TC-0178 | MGNOITEGSM     | 37 |
  | TC-0179 | MGNOITEGSM     | 31 |
  | TC-0180 | MGNOITEGSM     | 33 |
  | TC-0181 | MGNOITEGSM     | 34 |
  | TC-0182 | MGNOITEGSM     | 32 |
  | TC-0183 | MGPREDADOGSM   | 34 |
  | TC-0184 | MGPREDADOGSM   | 33 |
  | TC-0185 | MGPREDADOGSM   | 32 |
  | TC-0186 | MGPREDADOGSM   | 37 |
  | TC-0187 | MGPREDADOGSM   | 35 |
  | TC-0188 | MGPREDADOGSM   | 38 |
  | TC-0189 | MGPREDADOGSM   | 31 |
  | TC-0190 | MGPREDIARIOGSM | 31 |
  | TC-0191 | MGPREDIARIOGSM | 38 |
  | TC-0192 | MGPREDIARIOGSM | 37 |
  | TC-0193 | MGPREDIARIOGSM | 35 |
  | TC-0194 | MGPREDIARIOGSM | 34 |
  | TC-0195 | MGPREDIARIOGSM | 32 |
  | TC-0196 | MGPREDIARIOGSM | 33 |
  | TC-0197 | MGPREDIAR2GSM  | 37 |
  | TC-0198 | MGPREDIAR2GSM  | 32 |
  | TC-0199 | MGPREDIAR2GSM  | 34 |
  | TC-0200 | MGPREDIAR2GSM  | 33 |
  # | TC-0201 | MGPREDIAR2GSM  | 35 |
  # | TC-0202 | MGPREDIAR2GSM  | 31 |
  # | TC-0203 | MGPREDIAR2GSM  | 38 |
  # | TC-0204 | MGPREDIAR3GSM  | 34 |
  # | TC-0205 | MGPREDIAR3GSM  | 33 |
  # | TC-0206 | MGPREDIAR3GSM  | 31 |
  # | TC-0207 | MGPREDIAR3GSM  | 38 |
  # | TC-0208 | MGPREDIAR3GSM  | 37 |
  # | TC-0209 | MGPREDIAR3GSM  | 35 |
  # | TC-0210 | MGPREDIAR3GSM  | 32 |
  # | TC-0211 | MGRESPREGSM    | 35 |
  # | TC-0212 | MGRESPREGSM    | 38 |
  # | TC-0213 | MGRESPREGSM    | 34 |
  # | TC-0214 | MGRESPREGSM    | 37 |
  # | TC-0215 | MGRESPREGSM    | 33 |
  # | TC-0216 | MGRESPREGSM    | 32 |
  # | TC-0217 | MGRESPREGSM    | 31 |
  # | TC-0218 | MGVIVODIAGSM   | 31 |
  # | TC-0219 | MGVIVODIAGSM   | 37 |
  # | TC-0220 | MGVIVODIAGSM   | 35 |
  # | TC-0221 | MGVIVODIAGSM   | 32 |
  # | TC-0222 | MGVIVODIAGSM   | 34 |
  # | TC-0223 | MGVIVODIAGSM   | 33 |
  # | TC-0224 | MGVIVODIAGSM   | 38 |
  # | TC-0225 | MGVIVONOITEGSM | 35 |
  # | TC-0226 | MGVIVONOITEGSM | 34 |
  # | TC-0227 | MGVIVONOITEGSM | 38 |
  # | TC-0228 | MGVIVONOITEGSM | 31 |
  # | TC-0229 | MGVIVONOITEGSM | 32 |
  # | TC-0230 | MGVIVONOITEGSM | 33 |
  # | TC-0231 | MGVIVONOITEGSM | 37 |
  # | TC-0232 | MGVIVOTODAGSM  | 32 |
  # | TC-0233 | MGVIVOTODAGSM  | 33 |
  # | TC-0234 | MGVIVOTODAGSM  | 37 |
  # | TC-0235 | MGVIVOTODAGSM  | 35 |
  # | TC-0236 | MGVIVOTODAGSM  | 31 |
  # | TC-0237 | MGVIVOTODAGSM  | 34 |
  # | TC-0238 | MGVIVOTODAGSM  | 38 |
  # | TC-0239 | NEALTOVAL1GSM  | 81 |
  # | TC-0240 | NEALTOVAL1GSM  | 82 |
  # | TC-0241 | NEALTOVAL1GSM  | 87 |
  # | TC-0242 | NEALTOVAL1GSM  | 83 |
  # | TC-0243 | NEALTOVAL1GSM  | 85 |
  # | TC-0244 | NEALTOVAL1GSM  | 84 |
  # | TC-0245 | NEALTOVAL1GSM  | 86 |
  # | TC-0246 | NEALTOVAL1GSM  | 88 |
  # | TC-0247 | NEALTOVAL1GSM  | 89 |
  # | TC-0248 | NEALTOVAL2GSM  | 86 |
  # | TC-0249 | NEALTOVAL2GSM  | 81 |
  # | TC-0250 | NEALTOVAL2GSM  | 82 |
  # | TC-0251 | NEALTOVAL2GSM  | 89 |
  # | TC-0252 | NEALTOVAL2GSM  | 83 |
  # | TC-0253 | NEALTOVAL2GSM  | 84 |
  # | TC-0254 | NEALTOVAL2GSM  | 88 |
  # | TC-0255 | NEALTOVAL2GSM  | 85 |
  # | TC-0256 | NEALTOVAL2GSM  | 87 |
  # | TC-0257 | NEMAISMSGGSM   | 85 |
  # | TC-0258 | NEMAISMSGGSM   | 84 |
  # | TC-0259 | NEMAISMSGGSM   | 81 |
  # | TC-0260 | NEMAISMSGGSM   | 82 |
  # | TC-0261 | NEMAISMSGGSM   | 87 |
  # | TC-0262 | NEMAISMSGGSM   | 83 |
  # | TC-0263 | NEMAISMSGGSM   | 89 |
  # | TC-0264 | NEMAISMSGGSM   | 88 |
  # | TC-0265 | NEMAISMSGGSM   | 86 |
  # | TC-0266 | NEPREDADOGSM   | 89 |
  # | TC-0267 | NEPREDADOGSM   | 86 |
  # | TC-0268 | NEPREDADOGSM   | 84 |
  # | TC-0269 | NEPREDADOGSM   | 83 |
  # | TC-0270 | NEPREDADOGSM   | 81 |
  # | TC-0271 | NEPREDADOGSM   | 85 |
  # | TC-0272 | NEPREDADOGSM   | 88 |
  # | TC-0273 | NEPREDADOGSM   | 82 |
  # | TC-0274 | NEPREDADOGSM   | 87 |
  # | TC-0275 | NEPREDIARIOGSM | 87 |
  # | TC-0276 | NEPREDIARIOGSM | 84 |
  # | TC-0277 | NEPREDIARIOGSM | 83 |
  # | TC-0278 | NEPREDIARIOGSM | 89 |
  # | TC-0279 | NEPREDIARIOGSM | 88 |
  # | TC-0280 | NEPREDIARIOGSM | 82 |
  # | TC-0281 | NEPREDIARIOGSM | 86 |
  # | TC-0282 | NEPREDIARIOGSM | 85 |
  # | TC-0283 | NEPREDIARIOGSM | 81 |
  # | TC-0284 | NEPREDIAR2GSM  | 88 |
  # | TC-0285 | NEPREDIAR2GSM  | 85 |
  # | TC-0286 | NEPREDIAR2GSM  | 81 |
  # | TC-0287 | NEPREDIAR2GSM  | 86 |
  # | TC-0288 | NEPREDIAR2GSM  | 82 |
  # | TC-0289 | NEPREDIAR2GSM  | 87 |
  # | TC-0290 | NEPREDIAR2GSM  | 89 |
  # | TC-0291 | NEPREDIAR2GSM  | 83 |
  # | TC-0292 | NEPREDIAR2GSM  | 84 |
  # | TC-0293 | NEPREDIAR3GSM  | 81 |
  # | TC-0294 | NEPREDIAR3GSM  | 85 |
  # | TC-0295 | NEPREDIAR3GSM  | 86 |
  # | TC-0296 | NEPREDIAR3GSM  | 83 |
  # | TC-0297 | NEPREDIAR3GSM  | 84 |
  # | TC-0298 | NEPREDIAR3GSM  | 87 |
  # | TC-0299 | NEPREDIAR3GSM  | 89 |
  # | TC-0300 | NEPREDIAR3GSM  | 82 |
  # | TC-0301 | NEPREDIAR3GSM  | 88 |
  # | TC-0302 | NERESPREGSM    | 84 |
  # | TC-0303 | NERESPREGSM    | 83 |
  # | TC-0304 | NERESPREGSM    | 82 |
  # | TC-0305 | NERESPREGSM    | 88 |
  # | TC-0306 | NERESPREGSM    | 87 |
  # | TC-0307 | NERESPREGSM    | 85 |
  # | TC-0308 | NERESPREGSM    | 86 |
  # | TC-0309 | NERESPREGSM    | 89 |
  # | TC-0310 | NERESPREGSM    | 81 |
  # | TC-0311 | NEVIVODIAGSM   | 84 |
  # | TC-0312 | NEVIVODIAGSM   | 85 |
  # | TC-0313 | NEVIVODIAGSM   | 88 |
  # | TC-0314 | NEVIVODIAGSM   | 89 |
  # | TC-0315 | NEVIVODIAGSM   | 87 |
  # | TC-0316 | NEVIVODIAGSM   | 83 |
  # | TC-0317 | NEVIVODIAGSM   | 86 |
  # | TC-0318 | NEVIVODIAGSM   | 82 |
  # | TC-0319 | NEVIVODIAGSM   | 81 |
  # | TC-0320 | NEVIVONOITEGSM | 88 |
  # | TC-0321 | NEVIVONOITEGSM | 84 |
  # | TC-0322 | NEVIVONOITEGSM | 87 |
  # | TC-0323 | NEVIVONOITEGSM | 82 |
  # | TC-0324 | NEVIVONOITEGSM | 89 |
  # | TC-0325 | NEVIVONOITEGSM | 83 |
  # | TC-0326 | NEVIVONOITEGSM | 85 |
  # | TC-0327 | NEVIVONOITEGSM | 81 |
  # | TC-0328 | NEVIVONOITEGSM | 86 |
  # | TC-0329 | NEVIVOTODAGSM  | 82 |
  # | TC-0330 | NEVIVOTODAGSM  | 88 |
  # | TC-0331 | NEVIVOTODAGSM  | 83 |
  # | TC-0332 | NEVIVOTODAGSM  | 89 |
  # | TC-0333 | NEVIVOTODAGSM  | 86 |
  # | TC-0334 | NEVIVOTODAGSM  | 84 |
  # | TC-0335 | NEVIVOTODAGSM  | 85 |
  # | TC-0336 | NEVIVOTODAGSM  | 81 |
  # | TC-0337 | NEVIVOTODAGSM  | 87 |
  # | TC-0338 | PRALTOVAL1GSM  | 49 |
  # | TC-0339 | PRALTOVAL1GSM  | 48 |
  # | TC-0340 | PRALTOVAL1GSM  | 44 |
  # | TC-0341 | PRALTOVAL1GSM  | 41 |
  # | TC-0342 | PRALTOVAL1GSM  | 47 |
  # | TC-0343 | PRALTOVAL1GSM  | 43 |
  # | TC-0344 | PRALTOVAL1GSM  | 46 |
  # | TC-0345 | PRALTOVAL1GSM  | 45 |
  # | TC-0346 | PRALTOVAL1GSM  | 42 |
  # | TC-0347 | PRALTOVAL2GSM  | 47 |
  # | TC-0348 | PRALTOVAL2GSM  | 45 |
  # | TC-0349 | PRALTOVAL2GSM  | 49 |
  # | TC-0350 | PRALTOVAL2GSM  | 46 |
  # | TC-0351 | PRALTOVAL2GSM  | 44 |
  # | TC-0352 | PRALTOVAL2GSM  | 48 |
  # | TC-0353 | PRALTOVAL2GSM  | 43 |
  # | TC-0354 | PRALTOVAL2GSM  | 41 |
  # | TC-0355 | PRALTOVAL2GSM  | 42 |
  # | TC-0356 | PRBASICOGSM    | 45 |
  # | TC-0357 | PRBASICOGSM    | 47 |
  # | TC-0358 | PRBASICOGSM    | 43 |
  # | TC-0359 | PRBASICOGSM    | 48 |
  # | TC-0360 | PRBASICOGSM    | 41 |
  # | TC-0361 | PRBASICOGSM    | 49 |
  # | TC-0362 | PRBASICOGSM    | 44 |
  # | TC-0363 | PRBASICOGSM    | 46 |
  # | TC-0364 | PRBASICOGSM    | 42 |
  # | TC-0365 | PRJOVEMGSM     | 44 |
  # | TC-0366 | PRJOVEMGSM     | 47 |
  # | TC-0367 | PRJOVEMGSM     | 42 |
  # | TC-0368 | PRJOVEMGSM     | 45 |
  # | TC-0369 | PRJOVEMGSM     | 46 |
  # | TC-0370 | PRJOVEMGSM     | 49 |
  # | TC-0371 | PRJOVEMGSM     | 43 |
  # | TC-0372 | PRJOVEMGSM     | 41 |
  # | TC-0373 | PRJOVEMGSM     | 48 |
  # | TC-0374 | PRLIVREGSM     | 41 |
  # | TC-0375 | PRLIVREGSM     | 43 |
  # | TC-0376 | PRLIVREGSM     | 45 |
  # | TC-0377 | PRLIVREGSM     | 48 |
  # | TC-0378 | PRLIVREGSM     | 46 |
  # | TC-0379 | PRLIVREGSM     | 49 |
  # | TC-0380 | PRLIVREGSM     | 42 |
  # | TC-0381 | PRLIVREGSM     | 44 |
  # | TC-0382 | PRLIVREGSM     | 47 |
  # | TC-0383 | PRLIVRE1GSM    | 49 |
  # | TC-0384 | PRLIVRE1GSM    | 48 |
  # | TC-0385 | PRLIVRE1GSM    | 41 |
  # | TC-0386 | PRLIVRE1GSM    | 43 |
  # | TC-0387 | PRLIVRE1GSM    | 42 |
  # | TC-0388 | PRLIVRE1GSM    | 44 |
  # | TC-0389 | PRLIVRE1GSM    | 46 |
  # | TC-0390 | PRLIVRE1GSM    | 47 |
  # | TC-0391 | PRLIVRE1GSM    | 45 |
  # | TC-0392 | PRMAISMSGGSM   | 41 |
  # | TC-0393 | PRMAISMSGGSM   | 45 |
  # | TC-0394 | PRMAISMSGGSM   | 46 |
  # | TC-0395 | PRMAISMSGGSM   | 47 |
  # | TC-0396 | PRMAISMSGGSM   | 48 |
  # | TC-0397 | PRMAISMSGGSM   | 42 |
  # | TC-0398 | PRMAISMSGGSM   | 43 |
  # | TC-0399 | PRMAISMSGGSM   | 49 |
  # | TC-0400 | PRMAISMSGGSM   | 44 |
  # | TC-0401 | PRPREDADOGSM   | 49 |
  # | TC-0402 | PRPREDADOGSM   | 47 |
  # | TC-0403 | PRPREDADOGSM   | 48 |
  # | TC-0404 | PRPREDADOGSM   | 45 |
  # | TC-0405 | PRPREDADOGSM   | 44 |
  # | TC-0406 | PRPREDADOGSM   | 41 |
  # | TC-0407 | PRPREDADOGSM   | 42 |
  # | TC-0408 | PRPREDADOGSM   | 43 |
  # | TC-0409 | PRPREDADOGSM   | 46 |
  # | TC-0410 | PRPREDIARIOGSM | 46 |
  # | TC-0411 | PRPREDIARIOGSM | 47 |
  # | TC-0412 | PRPREDIARIOGSM | 48 |
  # | TC-0413 | PRPREDIARIOGSM | 41 |
  # | TC-0414 | PRPREDIARIOGSM | 42 |
  # | TC-0415 | PRPREDIARIOGSM | 44 |
  # | TC-0416 | PRPREDIARIOGSM | 45 |
  # | TC-0417 | PRPREDIARIOGSM | 43 |
  # | TC-0418 | PRPREDIARIOGSM | 49 |
  # | TC-0419 | PRPREDIAR2GSM  | 47 |
  # | TC-0420 | PRPREDIAR2GSM  | 46 |
  # | TC-0421 | PRPREDIAR2GSM  | 48 |
  # | TC-0422 | PRPREDIAR2GSM  | 49 |
  # | TC-0423 | PRPREDIAR2GSM  | 41 |
  # | TC-0424 | PRPREDIAR2GSM  | 43 |
  # | TC-0425 | PRPREDIAR2GSM  | 45 |
  # | TC-0426 | PRPREDIAR2GSM  | 44 |
  # | TC-0427 | PRPREDIAR2GSM  | 42 |
  # | TC-0428 | PRPREDIAR3GSM  | 46 |
  # | TC-0429 | PRPREDIAR3GSM  | 48 |
  # | TC-0430 | PRPREDIAR3GSM  | 44 |
  # | TC-0431 | PRPREDIAR3GSM  | 45 |
  # | TC-0432 | PRPREDIAR3GSM  | 47 |
  # | TC-0433 | PRPREDIAR3GSM  | 49 |
  # | TC-0434 | PRPREDIAR3GSM  | 41 |
  # | TC-0435 | PRPREDIAR3GSM  | 43 |
  # | TC-0436 | PRPREDIAR3GSM  | 42 |
  # | TC-0437 | PRRESPREGSM    | 43 |
  # | TC-0438 | PRRESPREGSM    | 44 |
  # | TC-0439 | PRRESPREGSM    | 49 |
  # | TC-0440 | PRRESPREGSM    | 46 |
  # | TC-0441 | PRRESPREGSM    | 41 |
  # | TC-0442 | PRRESPREGSM    | 48 |
  # | TC-0443 | PRRESPREGSM    | 42 |
  # | TC-0444 | PRRESPREGSM    | 47 |
  # | TC-0445 | PRRESPREGSM    | 45 |
  # | TC-0446 | PRVIVODIAGSM   | 46 |
  # | TC-0447 | PRVIVODIAGSM   | 44 |
  # | TC-0448 | PRVIVODIAGSM   | 49 |
  # | TC-0449 | PRVIVODIAGSM   | 48 |
  # | TC-0450 | PRVIVODIAGSM   | 43 |
  # | TC-0451 | PRVIVODIAGSM   | 41 |
  # | TC-0452 | PRVIVODIAGSM   | 42 |
  # | TC-0453 | PRVIVODIAGSM   | 45 |
  # | TC-0454 | PRVIVODIAGSM   | 47 |
  # | TC-0455 | PRVIVONOITEGSM | 42 |
  # | TC-0456 | PRVIVONOITEGSM | 41 |
  # | TC-0457 | PRVIVONOITEGSM | 48 |
  # | TC-0458 | PRVIVONOITEGSM | 45 |
  # | TC-0459 | PRVIVONOITEGSM | 47 |
  # | TC-0460 | PRVIVONOITEGSM | 46 |
  # | TC-0461 | PRVIVONOITEGSM | 49 |
  # | TC-0462 | PRVIVONOITEGSM | 44 |
  # | TC-0463 | PRVIVONOITEGSM | 43 |
  # | TC-0464 | PRVIVOTODAGSM  | 42 |
  # | TC-0465 | PRVIVOTODAGSM  | 49 |
  # | TC-0466 | PRVIVOTODAGSM  | 41 |
  # | TC-0467 | PRVIVOTODAGSM  | 44 |
  # | TC-0468 | PRVIVOTODAGSM  | 46 |
  # | TC-0469 | PRVIVOTODAGSM  | 47 |
  # | TC-0470 | PRVIVOTODAGSM  | 48 |
  # | TC-0471 | PRVIVOTODAGSM  | 43 |
  # | TC-0472 | PRVIVOTODAGSM  | 45 |
  # | TC-0473 | RJALTOVAL1GSM  | 22 |
  # | TC-0474 | RJALTOVAL1GSM  | 28 |
  # | TC-0475 | RJALTOVAL1GSM  | 27 |
  # | TC-0476 | RJALTOVAL1GSM  | 24 |
  # | TC-0477 | RJALTOVAL1GSM  | 21 |
  # | TC-0478 | RJALTOVAL2GSM  | 22 |
  # | TC-0479 | RJALTOVAL2GSM  | 28 |
  # | TC-0480 | RJALTOVAL2GSM  | 21 |
  # | TC-0481 | RJALTOVAL2GSM  | 24 |
  # | TC-0482 | RJALTOVAL2GSM  | 27 |
  # | TC-0483 | RJBASICOGSM    | 28 |
  # | TC-0484 | RJBASICOGSM    | 24 |
  # | TC-0485 | RJBASICOGSM    | 21 |
  # | TC-0486 | RJBASICOGSM    | 27 |
  # | TC-0487 | RJBASICOGSM    | 22 |
  # | TC-0488 | RJDIAGSM       | 27 |
  # | TC-0489 | RJDIAGSM       | 21 |
  # | TC-0490 | RJDIAGSM       | 24 |
  # | TC-0491 | RJDIAGSM       | 22 |
  # | TC-0492 | RJDIAGSM       | 28 |
  # | TC-0493 | RJMAISMSGGSM   | 24 |
  # | TC-0494 | RJMAISMSGGSM   | 27 |
  # | TC-0495 | RJMAISMSGGSM   | 22 |
  # | TC-0496 | RJMAISMSGGSM   | 21 |
  # | TC-0497 | RJMAISMSGGSM   | 28 |
  # | TC-0498 | RJNOITEGSM 	   | 22 |
  # | TC-0499 | RJNOITEGSM 	   | 24 |
  # | TC-0500 | RJNOITEGSM 	   | 28 |
  # | TC-0501 | RJNOITEGSM 	   | 27 |
  # | TC-0502 | RJNOITEGSM 	   | 21 |
  # | TC-0503 | RJPREDADOGSM   | 21 |
  # | TC-0504 | RJPREDADOGSM   | 28 |
  # | TC-0505 | RJPREDADOGSM   | 27 |
  # | TC-0506 | RJPREDADOGSM   | 22 |
  # | TC-0507 | RJPREDADOGSM   | 24 |
  # | TC-0508 | RJPREDIARIOGSM | 21 |
  # | TC-0509 | RJPREDIARIOGSM | 28 |
  # | TC-0510 | RJPREDIARIOGSM | 22 |
  # | TC-0511 | RJPREDIARIOGSM | 27 |
  # | TC-0512 | RJPREDIARIOGSM | 24 |
  # | TC-0513 | RJPREDIAR2GSM  | 27 |
  # | TC-0514 | RJPREDIAR2GSM  | 28 |
  # | TC-0515 | RJPREDIAR2GSM  | 21 |
  # | TC-0516 | RJPREDIAR2GSM  | 22 |
  # | TC-0517 | RJPREDIAR2GSM  | 24 |
  # | TC-0518 | RJPREDIAR3GSM  | 27 |
  # | TC-0519 | RJPREDIAR3GSM  | 24 |
  # | TC-0520 | RJPREDIAR3GSM  | 21 |
  # | TC-0521 | RJPREDIAR3GSM  | 22 |
  # | TC-0522 | RJPREDIAR3GSM  | 28 |
  # | TC-0523 | RJRESPREGSM    | 28 |
  # | TC-0524 | RJRESPREGSM    | 22 |
  # | TC-0525 | RJRESPREGSM    | 24 |
  # | TC-0526 | RJRESPREGSM    | 27 |
  # | TC-0527 | RJRESPREGSM    | 21 |
  # | TC-0528 | RJTODAGSM 	   | 21 |
  # | TC-0529 | RJTODAGSM 	   | 27 |
  # | TC-0530 | RJTODAGSM 	   | 24 |
  # | TC-0531 | RJTODAGSM 	   | 28 |
  # | TC-0532 | RJTODAGSM 	   | 22 |
  # | TC-0533 | RJVIVODIAGSM   | 28 |
  # | TC-0534 | RJVIVODIAGSM   | 21 |
  # | TC-0535 | RJVIVODIAGSM   | 22 |
  # | TC-0536 | RJVIVODIAGSM   | 24 |
  # | TC-0537 | RJVIVODIAGSM   | 27 |
  # | TC-0538 | RJVIVONOITEGSM | 21 |
  # | TC-0539 | RJVIVONOITEGSM | 24 |
  # | TC-0540 | RJVIVONOITEGSM | 27 |
  # | TC-0541 | RJVIVONOITEGSM | 28 |
  # | TC-0542 | RJVIVONOITEGSM | 22 |
  # | TC-0543 | RJVIVOTODAGSM  | 22 |
  # | TC-0544 | RJVIVOTODAGSM  | 24 |
  # | TC-0545 | RJVIVOTODAGSM  | 27 |
  # | TC-0546 | RJVIVOTODAGSM  | 28 |
  # | TC-0547 | RJVIVOTODAGSM  | 21 |
  # | TC-0548 | RSALTOVAL1GSM  | 54 |
  # | TC-0549 | RSALTOVAL1GSM  | 55 |
  # | TC-0550 | RSALTOVAL1GSM  | 51 |
  # | TC-0551 | RSALTOVAL1GSM  | 53 |
  # | TC-0552 | RSALTOVAL2GSM  | 53 |
  # | TC-0553 | RSALTOVAL2GSM  | 51 |
  # | TC-0554 | RSALTOVAL2GSM  | 55 |
  # | TC-0555 | RSALTOVAL2GSM  | 54 |
  # | TC-0556 | RSBASICOGSM    | 53 |
  # | TC-0557 | RSBASICOGSM    | 54 |
  # | TC-0558 | RSBASICOGSM    | 51 |
  # | TC-0559 | RSBASICOGSM    | 55 |
  # | TC-0560 | RSDIAGSM 	     | 51 |
  # | TC-0561 | RSDIAGSM 	     | 55 |
  # | TC-0562 | RSDIAGSM 	     | 54 |
  # | TC-0563 | RSDIAGSM 	     | 53 |
  # | TC-0564 | RSMAISMSGGSM   | 53 |
  # | TC-0565 | RSMAISMSGGSM   | 54 |
  # | TC-0566 | RSMAISMSGGSM   | 51 |
  # | TC-0567 | RSMAISMSGGSM   | 55 |
  # | TC-0568 | RSNOITEGSM     | 53 |
  # | TC-0569 | RSNOITEGSM     | 55 |
  # | TC-0570 | RSNOITEGSM     | 51 |
  # | TC-0571 | RSNOITEGSM     | 54 |
  # | TC-0572 | RSPREDADOGSM   | 51 |
  # | TC-0573 | RSPREDADOGSM   | 55 |
  # | TC-0574 | RSPREDADOGSM   | 53 |
  # | TC-0575 | RSPREDADOGSM   | 54 |
  # | TC-0576 | RSPREDIARIOGSM | 53 |
  # | TC-0577 | RSPREDIARIOGSM | 54 |
  # | TC-0578 | RSPREDIARIOGSM | 55 |
  # | TC-0579 | RSPREDIARIOGSM | 51 |
  # | TC-0580 | RSPREDIAR2GSM  | 51 |
  # | TC-0581 | RSPREDIAR2GSM  | 55 |
  # | TC-0582 | RSPREDIAR2GSM  | 53 |
  # | TC-0583 | RSPREDIAR2GSM  | 54 |
  # | TC-0584 | RSPREDIAR3GSM  | 55 |
  # | TC-0585 | RSPREDIAR3GSM  | 51 |
  # | TC-0586 | RSPREDIAR3GSM  | 54 |
  # | TC-0587 | RSPREDIAR3GSM  | 53 |
  # | TC-0588 | RSRESPREGSM    | 51 |
  # | TC-0589 | RSRESPREGSM    | 54 |
  # | TC-0590 | RSRESPREGSM    | 53 |
  # | TC-0591 | RSRESPREGSM    | 55 |
  # | TC-0592 | RSTODAGSM 	   | 55 |
  # | TC-0593 | RSTODAGSM 	   | 54 |
  # | TC-0594 | RSTODAGSM 	   | 51 |
  # | TC-0595 | RSTODAGSM 	   | 53 |
  # | TC-0596 | RSVIVODIAGSM   | 55 |
  # | TC-0597 | RSVIVODIAGSM   | 54 |
  # | TC-0598 | RSVIVODIAGSM   | 51 |
  # | TC-0599 | RSVIVODIAGSM   | 53 |
  # | TC-0600 | RSVIVONOITEGSM | 51 |
  # | TC-0601 | RSVIVONOITEGSM | 54 |
  # | TC-0602 | RSVIVONOITEGSM | 55 |
  # | TC-0603 | RSVIVONOITEGSM | 53 |
  # | TC-0604 | RSVIVOTODAGSM  | 51 |
  # | TC-0605 | RSVIVOTODAGSM  | 54 |
  # | TC-0606 | RSVIVOTODAGSM  | 53 |
  # | TC-0607 | RSVIVOTODAGSM  | 55 |
  # | TC-0608 | SPALTOVAL1GSM  | 13 |
  # | TC-0609 | SPALTOVAL1GSM  | 12 |
  # | TC-0610 | SPALTOVAL1GSM  | 11 |
  # | TC-0611 | SPALTOVAL1GSM  | 18 |
  # | TC-0612 | SPALTOVAL1GSM  | 19 |
  # | TC-0613 | SPALTOVAL1GSM  | 15 |
  # | TC-0614 | SPALTOVAL1GSM  | 16 |
  # | TC-0615 | SPALTOVAL1GSM  | 14 |
  # | TC-0616 | SPALTOVAL1GSM  | 17 |
  # | TC-0617 | SPALTOVAL2GSM  | 13 |
  # | TC-0618 | SPALTOVAL2GSM  | 17 |
  # | TC-0619 | SPALTOVAL2GSM  | 18 |
  # | TC-0620 | SPALTOVAL2GSM  | 14 |
  # | TC-0621 | SPALTOVAL2GSM  | 19 |
  # | TC-0622 | SPALTOVAL2GSM  | 11 |
  # | TC-0623 | SPALTOVAL2GSM  | 16 |
  # | TC-0624 | SPALTOVAL2GSM  | 12 |
  # | TC-0625 | SPALTOVAL2GSM  | 15 |
  # | TC-0626 | SPMAISMSGGSM   | 12 |
  # | TC-0627 | SPMAISMSGGSM   | 18 |
  # | TC-0628 | SPMAISMSGGSM   | 17 |
  # | TC-0629 | SPMAISMSGGSM   | 13 |
  # | TC-0630 | SPMAISMSGGSM   | 16 |
  # | TC-0631 | SPMAISMSGGSM   | 11 |
  # | TC-0632 | SPMAISMSGGSM   | 15 |
  # | TC-0633 | SPMAISMSGGSM   | 19 |
  # | TC-0634 | SPMAISMSGGSM   | 14 |
  # | TC-0635 | SPPREDADOGSM   | 13 |
  # | TC-0636 | SPPREDADOGSM   | 15 |
  # | TC-0637 | SPPREDADOGSM   | 17 |
  # | TC-0638 | SPPREDADOGSM   | 14 |
  # | TC-0639 | SPPREDADOGSM   | 12 |
  # | TC-0640 | SPPREDADOGSM   | 11 |
  # | TC-0641 | SPPREDADOGSM   | 16 |
  # | TC-0642 | SPPREDADOGSM   | 19 |
  # | TC-0643 | SPPREDADOGSM   | 18 |
  # | TC-0644 | SPPREDIARIOGSM | 15 |
  # | TC-0645 | SPPREDIARIOGSM | 12 |
  # | TC-0646 | SPPREDIARIOGSM | 19 |
  # | TC-0647 | SPPREDIARIOGSM | 18 |
  # | TC-0648 | SPPREDIARIOGSM | 16 |
  # | TC-0649 | SPPREDIARIOGSM | 17 |
  # | TC-0650 | SPPREDIARIOGSM | 11 |
  # | TC-0651 | SPPREDIARIOGSM | 14 |
  # | TC-0652 | SPPREDIARIOGSM | 13 |
  # | TC-0653 | SPPREDIAR2GSM  | 18 |
  # | TC-0654 | SPPREDIAR2GSM  | 15 |
  # | TC-0655 | SPPREDIAR2GSM  | 14 |
  # | TC-0656 | SPPREDIAR2GSM  | 12 |
  # | TC-0657 | SPPREDIAR2GSM  | 17 |
  # | TC-0658 | SPPREDIAR2GSM  | 13 |
  # | TC-0659 | SPPREDIAR2GSM  | 19 |
  # | TC-0660 | SPPREDIAR2GSM  | 11 |
  # | TC-0661 | SPPREDIAR2GSM  | 16 |
  # | TC-0662 | SPPREDIAR3GSM  | 19 |
  # | TC-0663 | SPPREDIAR3GSM  | 13 |
  # | TC-0664 | SPPREDIAR3GSM  | 12 |
  # | TC-0665 | SPPREDIAR3GSM  | 16 |
  # | TC-0666 | SPPREDIAR3GSM  | 14 |
  # | TC-0667 | SPPREDIAR3GSM  | 11 |
  # | TC-0668 | SPPREDIAR3GSM  | 17 |
  # | TC-0669 | SPPREDIAR3GSM  | 18 |
  # | TC-0670 | SPPREDIAR3GSM  | 15 |
  # | TC-0671 | SPRESPREGSM    | 12 |
  # | TC-0672 | SPRESPREGSM    | 17 |
  # | TC-0673 | SPRESPREGSM    | 18 |
  # | TC-0674 | SPRESPREGSM    | 19 |
  # | TC-0675 | SPRESPREGSM    | 14 |
  # | TC-0676 | SPRESPREGSM    | 11 |
  # | TC-0677 | SPRESPREGSM    | 15 |
  # | TC-0678 | SPRESPREGSM    | 16 |
  # | TC-0679 | SPRESPREGSM    | 13 |
  # | TC-0680 | TCOALTOVAL1GSM | 97 |
  # | TC-0681 | TCOALTOVAL1GSM | 91 |
  # | TC-0682 | TCOALTOVAL1GSM | 65 |
  # | TC-0683 | TCOALTOVAL1GSM | 95 |
  # | TC-0684 | TCOALTOVAL1GSM | 92 |
  # | TC-0685 | TCOALTOVAL1GSM | 94 |
  # | TC-0686 | TCOALTOVAL1GSM | 66 |
  # | TC-0687 | TCOALTOVAL1GSM | 96 |
  # | TC-0688 | TCOALTOVAL1GSM | 67 |
  # | TC-0689 | TCOALTOVAL1GSM | 64 |
  # | TC-0690 | TCOALTOVAL1GSM | 93 |
  # | TC-0691 | TCOALTOVAL1GSM | 68 |
  # | TC-0692 | TCOALTOVAL1GSM | 99 |
  # | TC-0693 | TCOALTOVAL1GSM | 98 |
  # | TC-0694 | TCOALTOVAL1GSM | 61 |
  # | TC-0695 | TCOALTOVAL1GSM | 62 |
  # | TC-0696 | TCOALTOVAL1GSM | 63 |
  # | TC-0697 | TCOALTOVAL1GSM | 69 |
  # | TC-0698 | TCOALTOVAL2GSM | 94 |
  # | TC-0699 | TCOALTOVAL2GSM | 63 |
  # | TC-0700 | TCOALTOVAL2GSM | 91 |
  # | TC-0701 | TCOALTOVAL2GSM | 64 |
  # | TC-0702 | TCOALTOVAL2GSM | 95 |
  # | TC-0703 | TCOALTOVAL2GSM | 69 |
  # | TC-0704 | TCOALTOVAL2GSM | 62 |
  # | TC-0705 | TCOALTOVAL2GSM | 61 |
  # | TC-0706 | TCOALTOVAL2GSM | 68 |
  # | TC-0707 | TCOALTOVAL2GSM | 92 |
  # | TC-0708 | TCOALTOVAL2GSM | 97 |
  # | TC-0709 | TCOALTOVAL2GSM | 65 |
  # | TC-0710 | TCOALTOVAL2GSM | 67 |
  # | TC-0711 | TCOALTOVAL2GSM | 96 |
  # | TC-0712 | TCOALTOVAL2GSM | 93 |
  # | TC-0713 | TCOALTOVAL2GSM | 99 |
  # | TC-0714 | TCOALTOVAL2GSM | 98 |
  # | TC-0715 | TCOALTOVAL2GSM | 66 |
  # | TC-0716 | TCOLIVREGSM    | 94 |
  # | TC-0717 | TCOLIVREGSM    | 67 |
  # | TC-0718 | TCOLIVREGSM    | 68 |
  # | TC-0719 | TCOLIVREGSM    | 97 |
  # | TC-0720 | TCOLIVREGSM    | 62 |
  # | TC-0721 | TCOLIVREGSM    | 96 |
  # | TC-0722 | TCOLIVREGSM    | 65 |
  # | TC-0723 | TCOLIVREGSM    | 61 |
  # | TC-0724 | TCOLIVREGSM    | 92 |
  # | TC-0725 | TCOLIVREGSM    | 69 |
  # | TC-0726 | TCOLIVREGSM    | 93 |
  # | TC-0727 | TCOLIVREGSM    | 91 |
  # | TC-0728 | TCOLIVREGSM    | 95 |
  # | TC-0729 | TCOLIVREGSM    | 63 |
  # | TC-0730 | TCOLIVREGSM    | 98 |
  # | TC-0731 | TCOLIVREGSM    | 64 |
  # | TC-0732 | TCOLIVREGSM    | 66 |
  # | TC-0733 | TCOLIVREGSM    | 99 |
  # | TC-0734 | TCOMAISMSGGSM  | 67 |
  # | TC-0735 | TCOMAISMSGGSM  | 61 |
  # | TC-0736 | TCOMAISMSGGSM  | 98 |
  # | TC-0737 | TCOMAISMSGGSM  | 96 |
  # | TC-0738 | TCOMAISMSGGSM  | 68 |
  # | TC-0739 | TCOMAISMSGGSM  | 93 |
  # | TC-0740 | TCOMAISMSGGSM  | 99 |
  # | TC-0741 | TCOMAISMSGGSM  | 92 |
  # | TC-0742 | TCOMAISMSGGSM  | 97 |
  # | TC-0743 | TCOMAISMSGGSM  | 62 |
  # | TC-0744 | TCOMAISMSGGSM  | 94 |
  # | TC-0745 | TCOMAISMSGGSM  | 91 |
  # | TC-0746 | TCOMAISMSGGSM  | 95 |
  # | TC-0747 | TCOMAISMSGGSM  | 64 |
  # | TC-0748 | TCOMAISMSGGSM  | 63 |
  # | TC-0749 | TCOMAISMSGGSM  | 66 |
  # | TC-0750 | TCOMAISMSGGSM  | 65 |
  # | TC-0751 | TCOMAISMSGGSM  | 69 |
  # | TC-0752 | TCOPREDADOGSM  | 64 |
  # | TC-0753 | TCOPREDADOGSM  | 69 |
  # | TC-0754 | TCOPREDADOGSM  | 94 |
  # | TC-0755 | TCOPREDADOGSM  | 99 |
  # | TC-0756 | TCOPREDADOGSM  | 66 |
  # | TC-0757 | TCOPREDADOGSM  | 61 |
  # | TC-0758 | TCOPREDADOGSM  | 93 |
  # | TC-0759 | TCOPREDADOGSM  | 95 |
  # | TC-0760 | TCOPREDADOGSM  | 67 |
  # | TC-0761 | TCOPREDADOGSM  | 68 |
  # | TC-0762 | TCOPREDADOGSM  | 63 |
  # | TC-0763 | TCOPREDADOGSM  | 65 |
  # | TC-0764 | TCOPREDADOGSM  | 98 |
  # | TC-0765 | TCOPREDADOGSM  | 97 |
  # | TC-0766 | TCOPREDADOGSM  | 92 |
  # | TC-0767 | TCOPREDADOGSM  | 62 |
  # | TC-0768 | TCOPREDADOGSM  | 96 |
  # | TC-0769 | TCOPREDADOGSM  | 91 |
  # | TC-0770 | TCOPREDIARIOGSM| 63 |
  # | TC-0771 | TCOPREDIARIOGSM| 64 |
  # | TC-0772 | TCOPREDIARIOGSM| 96 |
  # | TC-0773 | TCOPREDIARIOGSM| 98 |
  # | TC-0774 | TCOPREDIARIOGSM| 95 |
  # | TC-0775 | TCOPREDIARIOGSM| 91 |
  # | TC-0776 | TCOPREDIARIOGSM| 65 |
  # | TC-0777 | TCOPREDIARIOGSM| 94 |
  # | TC-0778 | TCOPREDIARIOGSM| 62 |
  # | TC-0779 | TCOPREDIARIOGSM| 92 |
  # | TC-0780 | TCOPREDIARIOGSM| 93 |
  # | TC-0781 | TCOPREDIARIOGSM| 69 |
  # | TC-0782 | TCOPREDIARIOGSM| 68 |
  # | TC-0783 | TCOPREDIARIOGSM| 99 |
  # | TC-0784 | TCOPREDIARIOGSM| 97 |
  # | TC-0785 | TCOPREDIARIOGSM| 67 |
  # | TC-0786 | TCOPREDIARIOGSM| 66 |
  # | TC-0787 | TCOPREDIARIOGSM| 61 |
  # | TC-0788 | TCOPREDIAR2GSM | 68 |
  # | TC-0789 | TCOPREDIAR2GSM | 91 |
  # | TC-0790 | TCOPREDIAR2GSM | 97 |
  # | TC-0791 | TCOPREDIAR2GSM | 95 |
  # | TC-0792 | TCOPREDIAR2GSM | 63 |
  # | TC-0793 | TCOPREDIAR2GSM | 93 |
  # | TC-0794 | TCOPREDIAR2GSM | 64 |
  # | TC-0795 | TCOPREDIAR2GSM | 92 |
  # | TC-0796 | TCOPREDIAR2GSM | 94 |
  # | TC-0797 | TCOPREDIAR2GSM | 61 |
  # | TC-0798 | TCOPREDIAR2GSM | 96 |
  # | TC-0799 | TCOPREDIAR2GSM | 62 |
  # | TC-0800 | TCOPREDIAR2GSM | 69 |
  # | TC-0801 | TCOPREDIAR2GSM | 99 |
  # | TC-0802 | TCOPREDIAR2GSM | 65 |
  # | TC-0803 | TCOPREDIAR2GSM | 66 |
  # | TC-0804 | TCOPREDIAR2GSM | 98 |
  # | TC-0805 | TCOPREDIAR2GSM | 67 |
  # | TC-0806 | TCOPREDIAR3GSM | 99 |
  # | TC-0807 | TCOPREDIAR3GSM | 64 |
  # | TC-0808 | TCOPREDIAR3GSM | 66 |
  # | TC-0809 | TCOPREDIAR3GSM | 93 |
  # | TC-0810 | TCOPREDIAR3GSM | 94 |
  # | TC-0811 | TCOPREDIAR3GSM | 68 |
  # | TC-0812 | TCOPREDIAR3GSM | 97 |
  # | TC-0813 | TCOPREDIAR3GSM | 63 |
  # | TC-0814 | TCOPREDIAR3GSM | 69 |
  # | TC-0815 | TCOPREDIAR3GSM | 95 |
  # | TC-0816 | TCOPREDIAR3GSM | 61 |
  # | TC-0817 | TCOPREDIAR3GSM | 91 |
  # | TC-0818 | TCOPREDIAR3GSM | 65 |
  # | TC-0819 | TCOPREDIAR3GSM | 62 |
  # | TC-0820 | TCOPREDIAR3GSM | 98 |
  # | TC-0821 | TCOPREDIAR3GSM | 67 |
  # | TC-0822 | TCOPREDIAR3GSM | 96 |
  # | TC-0823 | TCOPREDIAR3GSM | 92 |
  # | TC-0824 | TCORESPREGSM   | 97 |
  # | TC-0825 | TCORESPREGSM   | 98 |
  # | TC-0826 | TCORESPREGSM   | 62 |
  # | TC-0827 | TCORESPREGSM   | 67 |
  # | TC-0828 | TCORESPREGSM   | 66 |
  # | TC-0829 | TCORESPREGSM   | 93 |
  # | TC-0830 | TCORESPREGSM   | 64 |
  # | TC-0831 | TCORESPREGSM   | 99 |
  # | TC-0832 | TCORESPREGSM   | 91 |
  # | TC-0833 | TCORESPREGSM   | 94 |
  # | TC-0834 | TCORESPREGSM   | 63 |
  # | TC-0835 | TCORESPREGSM   | 69 |
  # | TC-0836 | TCORESPREGSM   | 95 |
  # | TC-0837 | TCORESPREGSM   | 96 |
  # | TC-0838 | TCORESPREGSM   | 65 |
  # | TC-0839 | TCORESPREGSM   | 92 |
  # | TC-0840 | TCORESPREGSM   | 68 |
  # | TC-0841 | TCORESPREGSM   | 61 |
  # | TC-0842 | TCOVIVODIAGSM  | 97 |
  # | TC-0843 | TCOVIVODIAGSM  | 91 |
  # | TC-0844 | TCOVIVODIAGSM  | 98 |
  # | TC-0845 | TCOVIVODIAGSM  | 62 |
  # | TC-0846 | TCOVIVODIAGSM  | 69 |
  # | TC-0847 | TCOVIVODIAGSM  | 61 |
  # | TC-0848 | TCOVIVODIAGSM  | 94 |
  # | TC-0849 | TCOVIVODIAGSM  | 96 |
  # | TC-0850 | TCOVIVODIAGSM  | 64 |
  # | TC-0851 | TCOVIVODIAGSM  | 67 |
  # | TC-0852 | TCOVIVODIAGSM  | 93 |
  # | TC-0853 | TCOVIVODIAGSM  | 95 |
  # | TC-0854 | TCOVIVODIAGSM  | 68 |
  # | TC-0855 | TCOVIVODIAGSM  | 63 |
  # | TC-0856 | TCOVIVODIAGSM  | 99 |
  # | TC-0857 | TCOVIVODIAGSM  | 66 |
  # | TC-0858 | TCOVIVODIAGSM  | 92 |
  # | TC-0859 | TCOVIVODIAGSM  | 65 |
  # | TC-0860 | TCOVIVONOITEGSM| 68 |
  # | TC-0861 | TCOVIVONOITEGSM| 64 |
  # | TC-0862 | TCOVIVONOITEGSM| 66 |
  # | TC-0863 | TCOVIVONOITEGSM| 63 |
  # | TC-0864 | TCOVIVONOITEGSM| 96 |
  # | TC-0865 | TCOVIVONOITEGSM| 91 |
  # | TC-0866 | TCOVIVONOITEGSM| 69 |
  # | TC-0867 | TCOVIVONOITEGSM| 62 |
  # | TC-0868 | TCOVIVONOITEGSM| 92 |
  # | TC-0869 | TCOVIVONOITEGSM| 99 |
  # | TC-0870 | TCOVIVONOITEGSM| 95 |
  # | TC-0871 | TCOVIVONOITEGSM| 98 |
  # | TC-0872 | TCOVIVONOITEGSM| 97 |
  # | TC-0873 | TCOVIVONOITEGSM| 94 |
  # | TC-0874 | TCOVIVONOITEGSM| 67 |
  # | TC-0875 | TCOVIVONOITEGSM| 93 |
  # | TC-0876 | TCOVIVONOITEGSM| 65 |
  # | TC-0877 | TCOVIVONOITEGSM| 61 |
  # | TC-0878 | TCOVIVOTODAGSM | 63 |
  # | TC-0879 | TCOVIVOTODAGSM | 67 |
  # | TC-0880 | TCOVIVOTODAGSM | 92 |
  # | TC-0881 | TCOVIVOTODAGSM | 99 |
  # | TC-0882 | TCOVIVOTODAGSM | 62 |
  # | TC-0883 | TCOVIVOTODAGSM | 61 |
  # | TC-0884 | TCOVIVOTODAGSM | 95 |
  # | TC-0885 | TCOVIVOTODAGSM | 94 |
  # | TC-0886 | TCOVIVOTODAGSM | 91 |
  # | TC-0887 | TCOVIVOTODAGSM | 68 |
  # | TC-0888 | TCOVIVOTODAGSM | 93 |
  # | TC-0889 | TCOVIVOTODAGSM | 64 |
  # | TC-0890 | TCOVIVOTODAGSM | 66 |
  # | TC-0891 | TCOVIVOTODAGSM | 69 |
  # | TC-0892 | TCOVIVOTODAGSM | 65 |
  # | TC-0893 | TCOVIVOTODAGSM | 96 |
  # | TC-0894 | TCOVIVOTODAGSM | 97 |
  # | TC-0895 | TCOVIVOTODAGSM | 98 |
  # | TC-0896 | VIVODIAGSM     | 15 |
  # | TC-0897 | VIVODIAGSM     | 16 |
  # | TC-0898 | VIVODIAGSM     | 17 |
  # | TC-0899 | VIVODIAGSM     | 12 |
  # | TC-0900 | VIVODIAGSM     | 18 |
  # | TC-0901 | VIVODIAGSM     | 14 |
  # | TC-0902 | VIVODIAGSM     | 11 |
  # | TC-0903 | VIVODIAGSM     | 13 |
  # | TC-0904 | VIVODIAGSM     | 19 |
  # | TC-0905 | VIVONOITEGSM   | 13 |
  # | TC-0906 | VIVONOITEGSM   | 14 |
  # | TC-0907 | VIVONOITEGSM   | 16 |
  # | TC-0908 | VIVONOITEGSM   | 11 |
  # | TC-0909 | VIVONOITEGSM   | 12 |
  # | TC-0910 | VIVONOITEGSM   | 19 |
  # | TC-0911 | VIVONOITEGSM   | 15 |
  # | TC-0912 | VIVONOITEGSM   | 17 |
  # | TC-0913 | VIVONOITEGSM   | 18 |
  # | TC-0914 | VIVOTODAGSM    | 15 |
  # | TC-0915 | VIVOTODAGSM    | 16 |
  # | TC-0916 | VIVOTODAGSM    | 17 |
  # | TC-0917 | VIVOTODAGSM    | 13 |
  # | TC-0918 | VIVOTODAGSM    | 14 |
  # | TC-0919 | VIVOTODAGSM    | 11 |
  # | TC-0920 | VIVOTODAGSM    | 19 |
  # | TC-0921 | VIVOTODAGSM    | 18 |
  # | TC-0922 | VIVOTODAGSM    | 12 |





@Banco @ID-0031 @life_cycle
  Esquema do Cenario: Validar SRV_PARAMETER_IMPACT  
  Dado o número do caso de teste "<testcase>"
  E valido a consulta com os parametros:
    | TIPO   | BASE | TABELA               | SERVICE         | PROFILE_AREA_GROUP| GEOGRAPHICAL_STATE | PARAMETER    | IMPACT |  QTD  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | CAD_ALARM_VT19  |    VT19_GRP_N     |        <UF>        | NUM_DAYS_VAL | SCP    |   -1  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | CCA_CAD_884     |    VT19_GRP_N     |        <UF>        | NUM_DAYS_VAL | SCP    |   -1  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | PCK_VT_CMB_884  |    VT19_GRP_N     |        <UF>        | NUM_DAYS_VAL | SCP    |   -1  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | PCT_CMB_VT19MSL |    VT19_GRP_N     |        <UF>        | NUM_DAYS_VAL | SCP    |   -1  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | PCT_CMB_VT19MSL |    VT19_GRP_N     |        <UF>        | RES_PDPCP_4G | PROV   |   -1  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | PCT_CMB_VT19MSL |    VT19_GRP_N     |        <UF>        | TECHNOLOGY   | PROV   |   -1  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | PCT_CMB_VT19MSL |    VT19_GRP_N     |        <UF>        | VEL_DEF_4G   | PROV   |   -1  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | PCT_CMB_VT19MSL |    VT19_GRP_N     |        <UF>        | VEL_INI_4G   | PROV   |   -1  |    
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | PCT_CMB_VT19DEG |    VT19_GRP_N     |        <UF>        | NUM_DAYS_VAL | SCP    |   -1  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | PCT_CMB_VT19DEG |    VT19_GRP_N     |        <UF>        | RES_PDPCP_4G | PROV   |   -1  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | PCT_CMB_VT19DEG |    VT19_GRP_N     |        <UF>        | TECHNOLOGY   | PROV   |   -1  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | PCT_CMB_VT19DEG |    VT19_GRP_N     |        <UF>        | VEL_DEF_4G   | PROV   |   -1  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | PCT_CMB_VT19DEG |    VT19_GRP_N     |        <UF>        | VEL_INI_4G   | PROV   |   -1  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | SRV_ACT_RF_VT19 |    GRP_RFSH_1_SRV |        <UF>        | NUM_DAYS_VAL | SCP    |   -1  |
  E valido a consulta com os parametros:
    | TIPO   | BASE | TABELA               | SERVICE         | PROFILE_AREA_GROUP | GEOGRAPHICAL_STATE | PARAMETER    | IMPACT |  QTD  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | SRV_TARIFA_VT19 |        *           |        <UF>        | NUM_DAYS_VAL | SCP    |   -1  |
    | SELECT | BDA  | SRV_PARAMETER_IMPACT | SRV_SVA_PRE11   |        *           |        <UF>        | NUM_DAYS_VAL | PROV   |   -1  |   
      
  Exemplos:
    | testcase | UF |
    | TC-0001  | AC |
    | TC-0002  | AL |
    | TC-0003  | AM |
    | TC-0004  | AP |
    | TC-0005  | BA |
    | TC-0006  | CE |
    | TC-0007  | DF |
    | TC-0008  | ES |
    | TC-0009  | GO |
    | TC-0010  | MA |
    | TC-0011  | MG |
    | TC-0012  | MS |
    | TC-0013  | MT |
    | TC-0014  | PA |
    | TC-0015  | PB |
    | TC-0016  | PE |
    | TC-0017  | PI |
    | TC-0018  | PR |
    | TC-0019  | RJ |
    | TC-0020  | RN |
    | TC-0021  | RO |
    | TC-0022  | RR |
    | TC-0023  | RS |
    | TC-0024  | SC |
    | TC-0025  | SE |
    | TC-0026  | SP |
    | TC-0027  | TO |




 @Banco @ID-0032 @promotion
    Esquema do Cenario: Validação franquia - Promo 884
    Dado o número do caso de teste "<testcase>"
    E valido a consulta com os parametros:
      | TIPO   | BASE | TABELA             | SERVICE         | PROFILE_AREA_GROUP | PLAFOND_TYPE | PORTION_VALUE | CREDIT_REASON | PARAM_KEY2     | QTD |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 68           | 600000        | 6552          | OFFLINE_CHARGE | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 68           | 600000        | 6552          | ONLINE_CHARGE  | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 68           | 600000        | 6552          | UPD_SEND_SMS   | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 68           | 600000        | 6552          | GENERIC        | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 68           | 600000        | 6552          | PRIV_GETS      | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 68           | 600000        | 6552          | PROMOTION      | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 69           | 10000         | 6552          | OFFLINE_CHARGE | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 69           | 10000         | 6552          | ONLINE_CHARGE  | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 69           | 10000         | 6552          | UPD_SEND_SMS   | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 69           | 10000         | 6552          | GENERIC        | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 69           | 10000         | 6552          | PRIV_GETS      | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 69           | 10000         | 6552          | PROMOTION      | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 72           | 600000        | 6552          | OFFLINE_CHARGE | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 72           | 600000        | 6552          | ONLINE_CHARGE  | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 72           | 600000        | 6552          | UPD_SEND_SMS   | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 72           | 600000        | 6552          | GENERIC        | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 72           | 600000        | 6552          | PRIV_GETS      | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 72           | 600000        | 6552          | PROMOTION      | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 73           | 10000         | 6552          | OFFLINE_CHARGE | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 73           | 10000         | 6552          | ONLINE_CHARGE  | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 73           | 10000         | 6552          | UPD_SEND_SMS   | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 73           | 10000         | 6552          | GENERIC        | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 73           | 10000         | 6552          | PRIV_GETS      | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19MSL | VT19_GRP_N         | 73           | 10000         | 6552          | PROMOTION      | 1   |      
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19DEG | VT19_GRP_N         | 68           | 600000        | 6558          | *              | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19DEG | VT19_GRP_N         | 68           | 600000        | 6558          | PROMOTION      | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19DEG | VT19_GRP_N         | 68           | 600000        | 6558          | GENERIC        | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19DEG | VT19_GRP_N         | 69           | 10000         | 6558          | *              | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19DEG | VT19_GRP_N         | 69           | 10000         | 6558          | PROMOTION      | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19DEG | VT19_GRP_N         | 69           | 10000         | 6558          | GENERIC        | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19DEG | VT19_GRP_N         | 72           | 600000        | 6558          | *              | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19DEG | VT19_GRP_N         | 72           | 600000        | 6558          | PROMOTION      | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19DEG | VT19_GRP_N         | 72           | 600000        | 6558          | GENERIC        | 1   |      
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19DEG | VT19_GRP_N         | 73           | 10000         | 6558          | *              | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19DEG | VT19_GRP_N         | 73           | 10000         | 6558          | PROMOTION      | 1   |
      | SELECT | BDA  | SRV_PACKAGE_CREDIT | PCT_CMB_VT19DEG | VT19_GRP_N         | 73           | 10000         | 6558          | GENERIC        | 1   |
    
    Exemplos:
      | testcase | 
      | TC-0001  | 





@Banco @ID-0033 @life_cycle
  Esquema do Cenario: Validar VT 884 - SRV_SERVICE_DEPENDENCY
  #Template de apoio:
  #PrePago_T86009_CFG563832_Pacotes_VTComboChipBonusDobro_v20.2.0 (ABA:DEPENDENCIA)
  #PrePago_T86008_CFG563826_Servicos_VivoTurbo_SVA_v20.2.0 (ABA:DEPENDENCIA)
  #PrePago_T86009_CFG563830_Pacotes_884_20.2.1
  Dado o número do caso de teste "<testcase>"
  Então valido a consulta com os parametros:
    | TIPO   | BASE | TABELA                 | SERVICE   | PROFILE         | SERVICE_DEPENDENT   | OPERATION   | CLIENT_TYPE | QTD |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | BAALTOVAL1GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | BAALTOVAL2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | BADIAGSM        | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | BAMAISMSGGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | BAPREDADOGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | BAPREDIAR2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | BAPREDIAR3GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | BAPREDIARIOGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | BARESPREGSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | BASICOGSM       | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | BAVIVODIAGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | BAVIVONOITEGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | BAVIVOTODAGSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | GOLGSM          | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | JOVEMGSM        | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | LIVREGOSPELGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | LIVREGSM        | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | LIVREMTVGSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGALTOVAL1GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGALTOVAL2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGCONTROLGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGCTRLEMPGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGFLEX45GSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGFLEX85GSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGMAISMSGGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGNOITEGSM      | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGPREDADOGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGPREDIAR2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGPREDIAR3GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGPREDIARIOGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGRESPREGSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGVIVODIAGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGVIVONOITEGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | MGVIVOTODAGSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | NEALTOVAL1GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | NEALTOVAL2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | NEMAISMSGGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | NEPREDADOGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | NEPREDIAR2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | NEPREDIAR3GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | NEPREDIARIOGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | NERESPREGSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | NEVIVODIAGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | NEVIVONOITEGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | NEVIVOTODAGSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRALTOVAL1GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRALTOVAL2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRBASICOGSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRJOVEMGSM      | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRLIVRE1GSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRLIVREGSM      | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRMAISMSGGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRPREDADOGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRPREDIAR2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRPREDIAR3GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRPREDIARIOGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRRESPREGSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRVIVODIAGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRVIVONOITEGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | PRVIVOTODAGSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJALTOVAL1GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJALTOVAL2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJBASICOGSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJDIAGSM        | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJMAISMSGGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJNOITEGSM      | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJPREDADOGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJPREDIAR2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJPREDIAR3GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJPREDIARIOGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJRESPREGSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJTODAGSM       | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJVIVODIAGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJVIVONOITEGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RJVIVOTODAGSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSALTOVAL1GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSALTOVAL2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSBASICOGSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSDIAGSM        | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSMAISMSGGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  | 
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSNOITEGSM      | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSPREDADOGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSPREDIAR2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSPREDIAR3GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSPREDIARIOGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSRESPREGSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSTODAGSM       | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSVIVODIAGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSVIVONOITEGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | RSVIVOTODAGSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | SPALTOVAL1GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | SPALTOVAL2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | SPMAISMSGGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | SPPREDADOGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | SPPREDIAR2GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | SPPREDIAR3GSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | SPPREDIARIOGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | SPRESPREGSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | TCOALTOVAL1GSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | TCOALTOVAL2GSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | TCOLIVREGSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | TCOMAISMSGGSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | TCOPREDADOGSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | TCOPREDIAR2GSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | TCOPREDIAR3GSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | TCOPREDIARIOGSM | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | TCORESPREGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | TCOVIVODIAGSM   | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | TCOVIVONOITEGSM | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | TCOVIVOTODAGSM  | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | VIVODIAGSM      | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | VIVONOITEGSM    | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  
    | SELECT | BDA  | SRV_SERVICE_DEPENDENCY | <SERVICE> | VIVOTODAGSM     | <SERVICE_DEPENDENT> | <OPERATION> |      7      |  1  |  

  Exemplos:
    | testcase| SERVICE         | SERVICE_DEPENDENT | OPERATION | SERVICE_DEPEND_EVENT | 
    | TC-0001 | PCT_CMB_VT19MSL | PCK_VT_CMB_884    | ACT       | ACT                  |
    | TC-0002 | PCT_CMB_VT19MSL | PCK_VT_CMB_884    | CHR       | ACT                  |
    | TC-0003 | PCT_CMB_VT19MSL | SRV_SVA_PRE11     | ACT       | ACT                  |
    | TC-0004 | PCT_CMB_VT19MSL | SRV_SVA_PRE11     | CHR       | ACT                  |
    | TC-0005 | PCT_CMB_VT19MSL | SRV_SVA_PRE11     | DES       | DES                  |
    | TC-0006 | PCT_CMB_VT19MSL | SRV_SVA_PRE11     | EXP       | DES                  |
    | TC-0007 | PCT_CMB_VT19MSL | SRV_SVA_PRE11     | RVL       | ACT                  |
    | TC-0008 | PCT_CMB_VT19MSL | SRV_SVA_PRE11     | SUS       | SUS                  |
    | TC-0009 | PCT_CMB_VT19MSL | PCT_CMB_VT1_MSL   | ACT       | DES                  |
    | TC-0010 | PCT_CMB_VT19MSL | PCT_CMB_VT2_DEG   | ACT       | DES                  |
    | TC-0011 | PCT_CMB_VT19MSL | ZAPUNLIMITED      | ACT       | DES                  |
    | TC-0012 | PCT_CMB_VT19MSL | PCT_CMB_DGT_FII   | ACT       | DES                  |
    | TC-0013 | PCT_CMB_VT19MSL | SRV_FF_DEP        | ACT       | DES                  |
    | TC-0014 | PCT_CMB_VT19MSL | SRV_TARIFA_VT9    | ACT       | ACT                  |
    | TC-0015 | PCT_CMB_VT19MSL | ZAPDAILY          | ACT       | DES                  |
    | TC-0016 | PCT_CMB_VT19MSL | SRV_NPP_DEP_FII   | ACT       | DES                  |
    | TC-0017 | PCT_CMB_VT19MSL | PACK_D1_200_FF    | ACT       | DES                  |
    | TC-0018 | PCT_CMB_VT19MSL | PACK_PP_1GB_MSL   | ACT       | DES                  |
    | TC-0019 | PCT_CMB_VT19MSL | ZAPMONTHLY        | ACT       | DES                  |
    | TC-0020 | PCT_CMB_VT19MSL | SRV_SVA_PRE9      | EXP       | DES                  |
    | TC-0021 | PCT_CMB_VT19MSL | PACK_VSEMPRE      | ACT       | DES                  |
    | TC-0022 | PCT_CMB_VT19MSL | TARIFA_ZERO       | ACT       | DES                  |
    | TC-0023 | PCT_CMB_VT19MSL | SRV_SVA_PRE9      | RMV       | DES                  |
    | TC-0024 | PCT_CMB_VT19DEG | SRV_TARIFA_VT9    | ACT       | ACT                  |
    | TC-0025 | PCT_CMB_VT19MSL | PACK_D3_020_DGT   | ACT       | DES                  |
    | TC-0026 | PCT_CMB_VT19MSL | SRV_TARIFA_VT9    | CHR       | ACT                  |
    | TC-0027 | PCT_CMB_VT19MSL | CONTROLVELOXZAP   | ACT       | DES                  |
    | TC-0028 | PCT_CMB_VT19MSL | PCT_CMB_VT6_DEG   | ACT       | DES                  |
    | TC-0029 | PCT_CMB_VT19DEG | BLK_NET_SRV_PRE   | ACT       | DES                  |
    | TC-0030 | PCT_CMB_VT19MSL | SRVDEPPROMO400    | ACT       | DES                  |
    | TC-0031 | PCT_CMB_VT19MSL | ZAP_PROMO_II      | ACT       | DES                  |
    | TC-0032 | PCT_CMB_VT19MSL | PACK_D1_250_MSL   | ACT       | DES                  |
    | TC-0033 | PCT_CMB_VT19MSL | PACK_RENEW        | ACT       | BLK                  |
    | TC-0034 | PCT_CMB_VT19MSL | PACK_VT_SEM_MSL   | ACT       | DES                  |
    | TC-0035 | PCT_CMB_VT19MSL | ZAPWEEKLY         | ACT       | DES                  |
    | TC-0036 | PCT_CMB_VT19MSL | SRV_SVA_PRE9      | SUS       | SUS                  |
    | TC-0037 | PCT_CMB_VT19MSL | PACK_D1_020_MSL   | ACT       | DES                  |
    | TC-0038 | PCT_CMB_VT19MSL | PACK_D3_020_MSL   | ACT       | DES                  |
    | TC-0039 | PCT_CMB_VT19MSL | PACK_RENEW_PC     | ACT       | BLK                  |
    | TC-0040 | PCT_CMB_VT19MSL | CONTROLVELPROMO   | ACT       | DES                  |
    | TC-0041 | PCT_CMB_VT19MSL | SRV_SVA_PRE9      | ACT       | ACT                  |
    | TC-0042 | PCT_CMB_VT19MSL | TARIFA_NORMAL     | ACT       | DES                  |
    | TC-0043 | PCT_CMB_VT11MSL | PCT_CMB_VT19MSL   | ACT       | DES                  |
    | TC-0044 | PCT_CMB_VT19MSL | SRV_TARIFA_VT9    | DES       | DES                  |
    | TC-0045 | PCT_CMB_VT19MSL | PCK_VT_CMB_884    | CHR       | ACT                  |
    | TC-0046 | PCT_CMB_VT19MSL | SRV_TARIFA_VT9    | RVL       | ACT                  |
    | TC-0047 | PCT_CMB_VT19MSL | PCT_CMB_SEM_FII   | ACT       | DES                  |
    | TC-0048 | PCT_CMB_VT19MSL | SRV_SVA_PRE9      | CHR       | ACT                  |
    | TC-0049 | PCT_CMB_VT19MSL | SRV_FLAG_CMB_VT   | ACT       | CHG                  |
    | TC-0050 | PCT_CMB_VT19MSL | PACK_OI_VOZ_31A   | ACT       | DES                  |
    | TC-0051 | PCT_CMB_VT19MSL | PCT_CMB_SEM_MSL   | ACT       | DES                  |
    | TC-0052 | PCT_CMB_VT19MSL | SRV_TRF_RDZ_FII   | ACT       | DES                  |
    | TC-0053 | PCT_CMB_VT19MSL | PACK_D1_050_MSL   | ACT       | DES                  |
    | TC-0054 | PCT_CMB_VT19MSL | PACK_D1_250_DGT   | ACT       | DES                  |
    | TC-0055 | PCT_CMB_VT19MSL | PACK_D3_020_AVL   | ACT       | DES                  |
    | TC-0056 | PCT_CMB_VT19MSL | PCT_CMB_SEM_DGT   | ACT       | DES                  |
    | TC-0057 | PCT_CMB_VT19MSL | TARIFA_REDUZIDA   | ACT       | DES                  |
    | TC-0058 | PCT_CMB_VT19MSL | SRV_TARIFA_VT9    | RMV       | DES                  |
    | TC-0059 | PCT_CMB_VT0_MSL | PCT_CMB_VT19MSL   | ACT       | DES                  |
    | TC-0060 | PCT_CMB_VT10MSL | PCT_CMB_VT19MSL   | ACT       | DES                  |
    | TC-0061 | PCT_CMB_VT19MSL | SRV_FLAG_CMB_VJ   | ACT       | CHG                  |
    | TC-0062 | PCT_CMB_VT19MSL | SCORE_CREDIT      | CHR       | ACT                  |
    | TC-0063 | PCT_CMB_VT19MSL | PCK_VT_CMB_884    | ACT       | ACT                  |
    | TC-0064 | PCT_CMB_VT19MSL | PCT_CMB_VT1_DEG   | ACT       | DES                  |
    | TC-0065 | PCT_CMB_VT19MSL | BLK_NET_SRV_PRE   | ACT       | DES                  |
    | TC-0066 | PCT_CMB_VT19MSL | PACK_DT_400_MSL   | ACT       | DES                  |
    | TC-0067 | PCT_CMB_VT19MSL | PACK_SEMANAL      | ACT       | DES                  |
    | TC-0068 | PCT_CMB_VT19MSL | PACK_VT_SEM_DEG   | ACT       | DES                  |
    | TC-0069 | PCT_CMB_VT19MSL | SRV_SVA_PRE9      | RVL       | ACT                  |
    | TC-0070 | PCT_CMB_VT19MSL | SRV_TARIFA_VT9    | SUS       | SUS                  |
    | TC-0071 | PCT_CMB_VT12MSL | PCT_CMB_VT19MSL   | ACT       | DES                  |
    | TC-0072 | PCT_CMB_VT19MSL | SRV_TARIFA_VT9    | EXP       | DES                  |
    | TC-0073 | PCT_CMB_VT19MSL | PCT_CMB_VT19MSL   | ACT       | BLK                  |
    | TC-0074 | PCT_CMB_VT19MSL | PCT_CMB_VT9_MSL   | ACT       | DES                  |
    | TC-0075 | PCT_CMB_VT19MSL | PCT_CMB_VT9_DEG   | ACT       | DES                  |
    | TC-0076 | PCT_CMB_VT19MSL | PACK_OI_VOZ_31A   | ACT       | DES                  |
  



  
@Banco @ID-0034 @life_cycle
  Esquema do Cenario: Validar tabela SRV_SERVICE_EXCLUSIVITY
  # PrePago_T86008_CFG563824_Servicos_884_20.2.0
  # PrePago_T86009_CFG563830_Pacotes_884_20.2.1
  Dado o número do caso de teste "<testcase>"
  E valido a consulta com os parametros:
    | TIPO   | BASE | TABELA                  | SRV_EXCL_STATE     | SRV_EXCL   | SRV_EXCL_DEPENDENT     |  SRV_EXCL_STATE_DEPENDENT     | PROFILE         | QTD |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRL149GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRL229GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRLT4GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRLI31GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRLI49GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRLI49GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRL149GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRL219GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRLT1GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRL126GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRLT3GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRL129GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRL129GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRL149GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRLI64GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRL239GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF25AGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL4NEGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF16NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF1NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTPT8NGSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF36NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF47NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF49NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF33NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF42NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF52NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF69NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF8NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF62NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF93NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF73NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRL122GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRLI49GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRLI64GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRL219GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRLT1GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRL219GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRL229GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRL32GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRLI34GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRLI49GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRLI64GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRL149GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRLT5GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRLT1GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRL229GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRLT4GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRL32GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRLI31GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRL126GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTPT4CRGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTPT4NGSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRLI34GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRL219GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTPT3NGSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL2NEGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF10NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF20NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL3AGSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF22NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF23NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF31NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF34AGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF96NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF97NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF91NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF63NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRLT1GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRLT4GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRL239GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRL126GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRL122GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRL364GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRL139GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRL219GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRL239GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRL229GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRLT4GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRLT5GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRL122GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRL331GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRL126GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRL349GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRL129GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRLT1GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRL239GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRLT4GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRL239GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRL122GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRL129GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRLI31GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRL122GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRLT5GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRLT1GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRLT3GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRLT4GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF24NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF25NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL64NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF12NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF46NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF58NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF59NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF3NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF50NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF51NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF28NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF88NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF79NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF6NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF70NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF82NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF94NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRL239GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRL80GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRL129GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRL364GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRLT1GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRLT1GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRL239GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRL334GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRL129GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRL122GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTPT3CRGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF24AGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL1AGSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF15NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF100GSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL34NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTPT8AGSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF45NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF35AGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF35NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF5NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF32NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF41NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF53NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF75NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF65NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF66NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF77NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF68NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF9NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF99NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF71NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF83NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF64NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRL219GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRL229GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRLI34GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRLI64GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRL139GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRLI34GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRL331GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRL334GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRL126GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRL129GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRL149GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRL239GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRLI49GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRL139GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRL32GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL49NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF17NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF27AGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL31GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL84NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF21NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF13NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF54NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF29NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF48NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF39NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF4NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF33AGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF44NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF76NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF98NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF80NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF60NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF74NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRL139GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRL149GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRL149GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRLT3GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRLI64GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRLT3GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRL32GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRL32GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRL126GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRL126GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTPT4NEGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRLI31GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRLI49GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | TCOCTRL229GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF19NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF26AGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTPT6NGSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF11NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF55NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF30NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF37NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF32AGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF43NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF29AGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF34NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF95NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF85NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF86NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF67NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF78NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF90NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF61NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRL149GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRLT3GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRL32GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRL32GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRL126GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRLI31GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRL129GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRLT3GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRLT5GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRL32GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRL122GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRL349GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRL139GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRL139GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRL219GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRLT3GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRL219GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRLT4GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRLT5GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRLT5GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRLI34GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRLI64GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | SPCTRL139GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTPT6AGSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTPT3NEGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL4AGSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF18NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL31NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL49GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF56NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF30AGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF57NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF31AGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF40NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF27NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF87NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF7NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF81NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF92NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF84NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | BACTRLT5GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRLT3GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | NECTRLT4GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | MGCTRLT5GSM     |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | PRCTRL139GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRL229GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRL229GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRLI31GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RSCTRL122GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | RJCTRLI34GSM    |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF14NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL2AGSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL64GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF26NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL34GSM   |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRL3NEGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF2NGSM  |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF28AGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF89NGSM |  1  |
    | SELECT | BDA  | SRV_SERVICE_EXCLUSIVITY | <SRV_EXCL_STATE>   | <SRV_EXCL> | <SRV_EXCL_DEPENDENT>   |  <SRV_EXCL_STATE_DEPENDENT>   | VIVOCTRLF72NGSM |  1  |

  Exemplos:
    | testcase | SRV_EXCL        | SRV_EXCL_STATE | SRV_EXCL_DEPENDENT      | SRV_EXCL_STATE_DEPENDENT |
    | TC-0001  | PACK_D1_250_MSL | ACT            | CAD_ALARM_VT19          | ACT                      |
    | TC-0002  | TARIFA_ZERO     | ACT            | CAD_ALARM_VT19          | ACT                      |
    | TC-0003  | PACK_SEMANAL    | ACT            | CAD_ALARM_VT19          | ACT                      |
    | TC-0004  | PACK_D1_020_MSL | ACT            | CAD_ALARM_VT19          | ACT                      |
    | TC-0005  | PACK_D1_050_MSL | ACT            | CAD_ALARM_VT19          | ACT                      |
    | TC-0006  | PACK_D3_020_MSL | ACT            | CAD_ALARM_VT19          | ACT                      |
    | TC-0007  | PACK_DT_400_MSL | ACT            | CAD_ALARM_VT19          | ACT                      |
    | TC-0008  | PACK_D3_020_AVL | ACT            | CAD_ALARM_VT19          | ACT                      |
    | TC-0009  | PACK_VSEMPRE    | ACT            | CAD_ALARM_VT19          | ACT                      | 
    | TC-0010  | B_BERRY_DADOS   | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0011  | B_BERRY_DADOS   | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0012  | B_BERRY_PROMO   | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0013  | CONTROLVELPROMO | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0014  | PACK_BB_MAIL    | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0015  | PACK_BB_MAIL    | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0016  | PACK_D1_020_MSL | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0017  | PACK_D3_020_AVL | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0018  | PACK_RENEW_PC   | PAT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0019  | PACK_SEMANAL    | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0020  | PACK_VSEMPRE    | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0021  | PCT_CMB_DGT_FII | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0022  | PCT_CMB_SEM_DGT | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0023  | PCT_CMB_SEM_DGT | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0024  | PCT_CMB_VT19DEG | ACT            | PACK_D1_020_MSL         | SUS                      |
    | TC-0025  | PCT_CMB_VT19DEG | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0026  | PCT_CMB_VT19DEG | ACT            | PACK_D1_050_MSL         | SUS                      |
    | TC-0027  | PCT_CMB_VT19DEG | ACT            | CONTROLVELOXZAP         | ACT                      |
    | TC-0028  | REDPACK200FF    | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0029  | REDPACKSEMANAL  | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0030  | REDVELBRASIL250 | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0031  | REDVELBRASIL250 | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0032  | ZAPMONTHLY      | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0033  | CONTROLVELOXZAP | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0034  | CONTROLVELOXZAP | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0035  | PACK_BB_MAIL    | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0036  | PACK_BB_SOCIAL  | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0037  | PACK_BB_SOCIAL  | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0038  | PACK_D1_250_DGT | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0039  | PACK_D1_250_DGT | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0040  | PACK_RENEW      | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0041  | PACK_RENEW_PC   | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0042  | PACK_VSEMPRE    | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0043  | PCT_CMB_VT19DEG | ACT            | PACK_SEMANAL            | ACT                      |
    | TC-0044  | PCT_CMB_VT19DEG | ACT            | ZAPDAILY                | ACT                      |
    | TC-0045  | PCT_CMB_VT19DEG | ACT            | PACK_D1_200_FF          | SUS                      |
    | TC-0046  | PCT_CMB_VT19DEG | ACT            | PACK_D1_250_DGT         | SUS                      |
    | TC-0047  | PCT_CMB_VT19DEG | ACT            | PACK_D1_250_MSL         | ACT                      |
    | TC-0048  | PCT_CMB_VT19DEG | ACT            | CONTROLVELPROMO         | SUS                      |
    | TC-0049  | PCT_CMB_VT19DEG | ACT            | PACK_D3_020_MSL         | SUS                      |
    | TC-0050  | REDPACKSEMANAL  | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0051  | REDVELBRASIL20  | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0052  | REDVELBRASIL400 | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0053  | REDVELBRASIL50  | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0054  | RED_PCT_CMB_SEM | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0055  | RED_PCT_SEM_FII | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0056  | ZAPDAILY        | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0057  | ZAPMONTHLY      | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0058  | BLK_NET_SRV_PRE | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0059  | B_BERRY_DADOS   | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0060  | B_BERRY_PROMO   | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0061  | CONTROLVELOXZAP | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0062  | PACK_D1_020_MSL | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0063  | PACK_D1_020_MSL | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0064  | PACK_D1_050_MSL | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0065  | PACK_D1_050_MSL | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0066  | PACK_D1_250_DGT | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0067  | PACK_D1_250_MSL | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0068  | PACK_D3_020_MSL | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0069  | PACK_D3_020_MSL | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0070  | PACK_PP_1GB_MSL | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0071  | PACK_RENEW      | PAT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0072  | PACK_RENEW_PC   | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0073  | PACK_SEMANAL    | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0074  | PCT_CMB_DGT_FII | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0075  | PCT_CMB_VT19DEG | ACT            | PACK_BB_SOCIAL          | ACT                      |
    | TC-0076  | PCT_CMB_VT19DEG | ACT            | PACK_D1_050_MSL         | ACT                      |
    | TC-0077  | PCT_CMB_VT19DEG | ACT            | ZAPDAILY                | SUS                      |
    | TC-0078  | PCT_CMB_VT19MSL | ACT            | B_BERRY_DADOS           | ACT                      |
    | TC-0079  | PCT_CMB_VT19DEG | ACT            | B_BERRY_PROMO           | ACT                      |
    | TC-0080  | PCT_CMB_VT19DEG | ACT            | B_BERRY_PROMO           | SUS                      |
    | TC-0081  | PCT_CMB_VT19DEG | ACT            | PACK_D3_020_DGT         | ACT                      |
    | TC-0082  | PCT_CMB_VT19MSL | ACT            | B_BERRY_PROMO           | ACT                      |
    | TC-0083  | PCT_CMB_VT19MSL | ACT            | B_BERRY_PROMO           | SUS                      |
    | TC-0084  | PCT_CMB_VT19MSL | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0085  | REDPACK200FF    | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0086  | REDPACKSEMANAL  | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0087  | REDPACKSEMANAL  | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0088  | REDVELBRASIL50  | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0089  | RED_PCT_SMS_INT | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0090  | ZAPWEEKLY       | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0091  | ZAPWEEKLY       | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0092  | B_BERRY_DADOS   | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0093  | CONTROLVELPROMO | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0094  | CONTROLVELPROMO | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0095  | PACK_BB_MAIL    | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0096  | PACK_BB_SOCIAL  | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0097  | PACK_D1_250_MSL | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0098  | PACK_D3_020_DGT | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0099  | PACK_D3_020_DGT | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0100  | PACK_D3_020_MSL | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0101  | PACK_PP_1GB_MSL | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0102  | PACK_RENEW      | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0103  | PACK_RENEW_PC   | PAT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0104  | PACK_VSEMPRE    | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0105  | PCT_CMB_SEM_DGT | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0106  | PCT_CMB_VT19DEG | ACT            | PACK_D1_020_MSL         | PAT                      |
    | TC-0107  | PCT_CMB_VT19DEG | ACT            | PACK_D1_200_FF          | ACT                      |
    | TC-0108  | PCT_CMB_VT19DEG | ACT            | PACK_D1_250_MSL         | SUS                      |
    | TC-0109  | PCT_CMB_VT19DEG | ACT            | PACK_D3_020_AVL         | ACT                      |
    | TC-0110  | PCT_CMB_VT19MSL | ACT            | PACK_BB_MAIL            | ACT                      |
    | TC-0111  | PCT_CMB_VT19MSL | ACT            | PACK_BB_SOCIAL          | ACT                      |
    | TC-0112  | PCT_CMB_VT19MSL | ACT            | PACK_BB_SOCIAL          | SUS                      |
    | TC-0113  | REDPACK200FF    | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0114  | REDVELBRASIL50  | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0115  | RED_PCT_CMB_SEM | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0116  | REDVELBRASILDGT | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0117  | ZAPDAILY        | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0118  | ZAP_PROMO_II    | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0119  | BLK_NET_SRV_PRE | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0120  | B_BERRY_PROMO   | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0121  | PACK_D1_050_MSL | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0122  | PACK_D1_250_DGT | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0123  | PACK_D3_020_AVL | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0124  | PACK_RENEW_PC   | PAT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0125  | PACK_RENEW_PC   | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0126  | PACK_SEMANAL    | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0127  | PCT_CMB_DGT_FII | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0128  | PCT_CMB_VT19DEG | ACT            | PACK_PP_1GB_MSL         | ACT                      |
    | TC-0129  | PCT_CMB_VT19DEG | ACT            | ZAP_PROMO_II            | ACT                      |
    | TC-0130  | PCT_CMB_VT19DEG | ACT            | PACK_D3_020_AVL         | SUS                      |
    | TC-0131  | PCT_CMB_VT19DEG | ACT            | PACK_D3_020_DGT         | SUS                      |
    | TC-0132  | REDVELBRASIL20  | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0133  | REDVELBRASIL250 | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0134  | REDVELBRASIL400 | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0135  | REDVELBRASIL400 | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0136  | REDVELBRASILDGT | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0137  | RED_PCT_SMS_INT | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0138  | ZAP_PROMO_II    | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0139  | BLK_NET_SRV_PRE | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0140  | CONTROLVELPROMO | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0141  | PACK_D3_020_DGT | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0142  | PACK_PP_1GB_MSL | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0143  | PACK_RENEW      | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0144  | PACK_RENEW      | PAT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0145  | PACK_RENEW_PC   | PAT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0146  | PCT_CMB_VT19DEG | ACT            | PACK_BB_MAIL            | ACT                      |
    | TC-0147  | PCT_CMB_VT19MSL | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0148  | PCT_CMB_VT19DEG | ACT            | PACK_SEMANAL            | SUS                      |
    | TC-0149  | PCT_CMB_VT19DEG | ACT            | PACK_D1_250_DGT         | ACT                      |
    | TC-0150  | PCT_CMB_VT19DEG | ACT            | B_BERRY_DADOS           | ACT                      |
    | TC-0151  | PCT_CMB_VT19DEG | ACT            | ZAP_PROMO_II            | SUS                      |
    | TC-0152  | PCT_CMB_VT19DEG | ACT            | CONTROLVELPROMO         | ACT                      |
    | TC-0153  | REDVELBRASILDGT | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0154  | ZAPDAILY        | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0155  | ZAPWEEKLY       | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0156  | BLK_NET_SRV_PRE | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0157  | CONTROLVELOXZAP | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0158  | PACK_D1_020_MSL | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0159  | PACK_D1_250_MSL | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0160  | PACK_D3_020_DGT | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0161  | PACK_RENEW      | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0162  | PACK_RENEW      | PAT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0163  | PACK_RENEW      | PAT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0164  | PCT_CMB_DGT_FII | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0165  | PCT_CMB_SEM_DGT | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0166  | PCT_CMB_VT19DEG | ACT            | PACK_BB_MAIL            | SUS                      |
    | TC-0167  | PCT_CMB_VT19DEG | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0168  | PCT_CMB_VT19DEG | ACT            | ZAPMONTHLY              | ACT                      |
    | TC-0169  | PCT_CMB_VT19DEG | ACT            | ZAPMONTHLY              | SUS                      |
    | TC-0170  | PCT_CMB_VT19DEG | ACT            | ZAPWEEKLY               | ACT                      |
    | TC-0171  | PCT_CMB_VT19MSL | ACT            | B_BERRY_DADOS           | SUS                      |
    | TC-0172  | PCT_CMB_VT19DEG | ACT            | PACK_D3_020_MSL         | ACT                      |
    | TC-0173  | REDVELBRASIL20  | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0174  | REDVELBRASIL20  | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0175  | REDVELBRASIL400 | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0176  | REDVELBRASILDGT | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0177  | RED_PCT_SMS_INT | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0178  | ZAPDAILY        | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0179  | ZAPMONTHLY      | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0180  | ZAPMONTHLY      | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0181  | ZAPWEEKLY       | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0182  | B_BERRY_PROMO   | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0183  | PACK_BB_SOCIAL  | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0184  | PACK_D1_050_MSL | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0185  | PACK_D1_250_MSL | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0186  | PACK_D3_020_AVL | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0187  | PACK_D3_020_AVL | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0188  | PACK_D3_020_MSL | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0189  | PACK_PP_1GB_MSL | ACT            | PCT_CMB_VT19DEG         | ACT                      |
    | TC-0190  | PACK_RENEW_PC   | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0191  | PACK_SEMANAL    | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0192  | PACK_VSEMPRE    | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0193  | PCT_CMB_VT19DEG | ACT            | PACK_PP_1GB_MSL         | SUS                      |
    | TC-0194  | PCT_CMB_VT19DEG | ACT            | PACK_BB_SOCIAL          | SUS                      |
    | TC-0195  | PCT_CMB_VT19DEG | ACT            | PACK_D1_020_MSL         | ACT                      |
    | TC-0196  | PCT_CMB_VT19DEG | ACT            | BLK_NET_SRV_PRE         | ACT                      |
    | TC-0197  | PCT_CMB_VT19DEG | ACT            | BLK_NET_SRV_PRE         | SUS                      |
    | TC-0198  | PCT_CMB_VT19DEG | ACT            | ZAPWEEKLY               | SUS                      |
    | TC-0199  | PCT_CMB_VT19DEG | ACT            | B_BERRY_DADOS           | SUS                      |
    | TC-0200  | PCT_CMB_VT19DEG | ACT            | CONTROLVELOXZAP         | SUS                      |
    | TC-0201  | PCT_CMB_VT19MSL | ACT            | PACK_BB_MAIL            | SUS                      |
    | TC-0202  | REDPACK200FF    | ACT            | PCT_CMB_VT19DEG         | SUS                      |
    | TC-0203  | REDVELBRASIL250 | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0204  | REDVELBRASIL50  | ACT            | PCT_CMB_VT19MSL         | SUS                      |
    | TC-0205  | RED_PCT_SEM_FII | ACT            | PCT_CMB_VT19MSL         | ACT                      |
    | TC-0206  | RED_PCT_SMS_INT | ACT            | PCT_CMB_VT19DEG         | SUS                      |
      


@Banco @ID-0035 @life_cycle
    Esquema do Cenario:  Validar configuração da SRV_SERVICE_INCLUSIVITY 
    # Aba INCLUSIVIDADE do template: 
    # PrePago_T86008_CFG563828_Servicos_VivoTurboRefreshVTMensal_884_v20.2.0
    # PrePago_T86009_CFG563830_Pacotes_884_20.2.1  
    Dado o número do caso de teste "<testcase>"
    Então valido a consulta com os parametros:
      | TIPO   | BASE | TABELA                  | SRV_INCL        | SRV_INCL_STATE | SRV_INCL_DEPENDENT | SRV_INCL_STATE_DEPENDENT |  QTD |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | DATA_PACK_RS_P  |       ACT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | DATA_PACK_RS_P  |       ACT      |  <SERVICE>         |            SUS           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | DATA_PACK_RS_P  |       ACT      |  <SERVICE>         |            SUS           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | PACK_PFA_M10S30 |       ACT      |  <SERVICE>         |            SUS           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | DATA_PACK_COMP  |       ACT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | PACK_PFA_M10S30 |       ACT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | DATA_PACK_MSG_P |       ACT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | DATA_PACK_MSG_P |       ACT      |  <SERVICE>         |            SUS           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | DATA_PACK_MSG_M |       ACT      |  <SERVICE>         |            SUS           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | PACK_PFA_M20S30 |       ACT      |  <SERVICE>         |            SUS           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | PACK_PFA_M10S30 |       PAT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | DATA_PACK_RS_P  |       ACT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | PACK_PFA_M20S30 |       ACT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | PACK_PFA_M20S30 |       PAT      |  <SERVICE>         |            SUS           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | DATA_PACK_MSG_M |       ACT      |  <SERVICE>         |            SUS           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | PACK_PFA_M20S30 |       PAT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | PACK_PFA_M20S30 |       PAT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | DATA_PACK_MSG_P |       ACT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | DATA_PACK_MSG_P |       ACT      |  <SERVICE>         |            SUS           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | DATA_PACK_MSG_M |       ACT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | PACK_PFA_M20S30 |       ACT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | PACK_PFA_M10S30 |       PAT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | PACK_PFA_M10S30 |       PAT      |  <SERVICE>         |            SUS           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | DATA_PACK_MSG_M |       ACT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | PACK_PFA_M10S30 |       ACT      |  <SERVICE>         |            ACT           |  144 |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | SRV_ACT_RF_VT19 |       ACT      |  <SERVICE>         |            ACT           |  144 |
      Então valido a consulta com os parametros:
      | TIPO   | BASE | TABELA                  | SRV_INCL        | SRV_INCL_STATE | SRV_INCL_DEPENDENT | SRV_INCL_STATE_DEPENDENT |  QTD |
      | SELECT | BDA  | SRV_SERVICE_INCLUSIVITY | SRV_ACT_RF_VT19 |       ACT      |  PCT_CMB_VT18MSL   |            ACT           |  144 |
                                                                   
    Exemplos:
      | testcase | SERVICE          |
      | TC-0001  | PCT_CMB_VT19DEG  | 
      | TC-0002  | PCT_CMB_VT19DEG  | 
      | TC-0003  | PCT_CMB_VT19MSL  | 
      | TC-0004  | PCT_CMB_VT19MSL  | 
      | TC-0005  | PCT_CMB_VT19MSL  | 
      | TC-0006  | PCT_CMB_VT19MSL  | 
      | TC-0007  | PCT_CMB_VT19DEG  | 
      | TC-0008  | PCT_CMB_VT19DEG  | 
      | TC-0009  | PCT_CMB_VT19MSL  | 
      | TC-0010  | PCT_CMB_VT19MSL  | 
      | TC-0011  | PCT_CMB_VT19DEG  | 
      | TC-0012  | PCT_CMB_VT19MSL  | 
      | TC-0013  | PCT_CMB_VT19MSL  | 
      | TC-0014  | PCT_CMB_VT19MSL  | 
      | TC-0015  | PCT_CMB_VT19DEG  | 
      | TC-0016  | PCT_CMB_VT19DEG  | 
      | TC-0017  | PCT_CMB_VT19MSL  | 
      | TC-0018  | PCT_CMB_VT19MSL  | 
      | TC-0019  | PCT_CMB_VT19MSL  | 
      | TC-0020  | PCT_CMB_VT19MSL  | 
      | TC-0021  | PCT_CMB_VT19DEG  | 
      | TC-0022  | PCT_CMB_VT19MSL  | 
      | TC-0023  | PCT_CMB_VT19MSL  | 
      | TC-0024  | PCT_CMB_VT19DEG  | 
      | TC-0025  | PCT_CMB_VT19DEG  | 
      | TC-0026  | PCT_CMB_VT19MSL  | 




@Banco @ID-0036 @life_cycle 
  # Aba PARAMETROS do template:
  # PrePago_T86008_CFG563824_Servicos_884_20.2.0
  # PrePago_T86008_CFG563828_Servicos_VivoTurboRefreshVTMensal_884_v20.2.0
  # PrePago_T86009_CFG563832_Pacotes_VTComboChipBonusDobro_v20.2.0
  # PrePago_T86008_CFG563826_Servicos_VivoTurbo_SVA_v20.2.0
  Esquema do Cenario: Validacao do serviço na SRV_SERVICE_PARAMETER
  Dado o número do caso de teste "<testcase>"
  E valido a consulta com os parametros:
    | TIPO   | BASE | TABELA                | SERVICE         | PARAMETER    | VALUE                 | DESCR                   | GEOGRAPHICAL_STATE |  QTD   |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | SRV_TARIFA_VT19 | NUM_DAYS_VAL | 1825                  | Validade                |         <UF>       |  -1    |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | CAD_ALARM_VT19  | NUM_DAYS_VAL | 60                    | Validade                |         <UF>       |  -1    |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | CCA_CAD_884     | NUM_DAYS_VAL | 9999                  | Validade                |         <UF>       |  -1    |
  E valido a consulta com os parametros:
    | TIPO   | BASE | TABELA                | SERVICE         | PARAMETER    | VALUE                 | DESCR                   | PROFILE_AREA_GROUP | GEOGRAPHICAL_STATE |  QTD   |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | SRV_ACT_RF_VT19 | NUM_DAYS_VAL | 15                    | Validade do servico     |  GRP_RFSH_1_SRV    |       <UF>         |  -1    |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCK_VT_CMB_884  | NUM_DAYS_VAL | 15                    | Validade                |    VT19_GRP_N      |       <UF>         |  -1    |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCK_VT_CMB_884  | LIMIT        | PCT_CMB_VT19MSL.LIMIT | Limite de velocidade Mb |    VT19_GRP_N      |       <UF>         |  -1    |

  E valido a consulta com os parametros:
    | TIPO   | BASE | TABELA                | SERVICE         | PARAMETER       | DESCR                            | GEOGRAPHICAL_STATE |  QTD   |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | SRV_ACT_RF_VT19 | SRV_MOVED_VALUE | Saldo remanescente da Vivo Turbo |         <UF>       |   -1   |

  E valido a consulta com os parametros:
    | TIPO   | BASE | TABELA                | SERVICE       | PARAMETER    | DESCR               | VALUE    | GEOGRAPHICAL_STATE |  QTD   |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | SRV_SVA_PRE11 | SERVICE_ID   | Codigo do servico   | PENDENTE |  <UF>              |   -1   |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | SRV_SVA_PRE11 | MSISDN       | MSISDN do assinante | MSISDN   |  <UF>              |   -1   |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | SRV_SVA_PRE11 | COUNTRY_COD  | Codigo do pais      | 55       |  <UF>              |   -1   |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | SRV_SVA_PRE11 | NUM_DAYS_VAL | Validade do servico | 0        |  <UF>              |   -1   |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | SRV_SVA_PRE11 | PRODUCT_ID   | Codigo do produto   | PENDENTE |  <UF>              |   -1   |

  E valido a consulta com os parametros:
    | TIPO   | BASE | TABELA                | SERVICE         | PARAMETER      | VALUE  | PROFILE_AREA_GROUP | GEOGRAPHICAL_STATE | QTD |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | CAPTIVE_IMPACT | 1      |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | CAPTIVE_IMPACT | 1      |     VT19_GRP_N     | <UF>               | -1  |

  E valido a consulta com os parametros:
    | TIPO   | BASE | TABELA                | SERVICE         | PARAMETER     | VALUE            | DESCR                                 | PROFILE_AREA_GROUP | GEOGRAPHICAL_STATE | QTD |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | VEL_REDUZIDA  | 32Kbps           | Velocidade Reduzida                   |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | VEL_INICIAL   | 6Mbps            | Velocidade Padrao                     |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | VEL_DEF_4G    | 1                | Velocidade Default 4G do Pacote       |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | MSISDN        | MSISDN           | MSISDN do assinante                   |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | TECHNOLOGY    | 4G               | Tecnologia do Pacote                  |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | LIMIT         | 5368709120       | Limite de velocidade Mb               |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | VEL_INI_4G    | 112              | Velocidade Inicial 4G do Pacote       |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | NUM_DAYS_VAL  | 15               | Validade                              |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | INT           | INT_CALL_CENTER  | Flag de Interceptacao do Captive      |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | CATEGORY      | PRE              | Categoria para identificacao de Rede  |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | TRAF_REDUZIDO | 5GB              | Trafego na Velocidade Reduzida        |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | STATUS_ACT    | 809              | CONTRATACAO DO PACOTE COMBO SEMANAL   |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | RES_PDPCP_4G  | PRE_INTERNET_10M | VEL. NORMAL 4G                        |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | SERVICE_TYPE  | PCT              | Tipo do servico de dados              |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | STEP_ID       | NULL             | ID do step cobrando                   |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19MSL | REVAL_PERIOD  | 30               | Periodicidade de renovacao do produto |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | VEL_REDUZIDA  | 32Kbps           | Velocidade Reduzida                   |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | VEL_INICIAL   | 6Mbps            | Velocidade Padrao                     |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | VEL_DEF_4G    | 1                | Velocidade Default 4G do Pacote       |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | MSISDN        | MSISDN           | MSISDN do assinante                   |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | TECHNOLOGY    | 4G               | Tecnologia do Pacote                  |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | LIMIT         | 5368709120       | Limite de velocidade Mb               |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | VEL_INI_4G    | 112              | Velocidade Inicial 4G do Pacote       |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | NUM_DAYS_VAL  | 60               | Validade                              |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | INT           | INT_CALL_CENTER  | Flag de Interceptacao do Captive      |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | CATEGORY      | PRE              | Categoria para identificacao de Rede  |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | TRAF_REDUZIDO | 5GB              | Trafego na Velocidade Reduzida        |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | STATUS_ACT    | 809              | CONTRATACAO DO PACOTE COMBO SEMANAL   |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | RES_PDPCP_4G  | PRE_INTERNET_10M | VEL. NORMAL 4G                        |     VT19_GRP_N     | <UF>               | -1  |
    | SELECT | BDA  | SRV_SERVICE_PARAMETER | PCT_CMB_VT19DEG | SERVICE_TYPE  | PCT              | Tipo do servico de dados              |     VT19_GRP_N     | <UF>               | -1  |

  Exemplos:
    | testcase | UF |
    | TC-0001  | AC |
    | TC-0002  | AL |
    | TC-0003  | AM |
    | TC-0004  | AP |
    | TC-0005  | BA |
    | TC-0006  | CE |
    | TC-0007  | DF |
    | TC-0008  | ES |
    | TC-0009  | GO |
    | TC-0010  | MA |
    | TC-0011  | MG |
    | TC-0012  | MS |
    | TC-0013  | MT |
    | TC-0014  | PA |
    | TC-0015  | PB |
    | TC-0016  | PE |
    | TC-0017  | PI |
    | TC-0018  | PR |
    | TC-0019  | RJ |
    | TC-0020  | RN |
    | TC-0021  | RO |
    | TC-0022  | RR |
    | TC-0023  | RS |
    | TC-0024  | SC |
    | TC-0025  | SE |
    | TC-0026  | SP |
    | TC-0027  | TO |




 @Banco @ID-0037 @life_cycle
  Esquema do Cenario:  Validar as categorias - SRV_SERVICE_PROFILE
  # Template de apoio: 
  # PrePago_T86008_CFG563824_Servicos_884_20.2.0 (ABA:Pacotes e Planos )
  # PrePago_T86008_CFG563826_Servicos_VivoTurbo_SVA_v20.2.0 (ABA:Pacotes e Planos )
  # PrePago_T86008_CFG563828_Servicos_VivoTurboRefreshVTMensal_884_v20.2.0 (ABA:Pacotes e Planos )
  # PrePago_T86009_CFG563832_Pacotes_VTComboChipBonusDobro_v20.2.0 (ABA:Pacotes e Planos )
  Dado o número do caso de teste "<testcase>"
  Então valido a consulta com os parametros:
    | TIPO   | BASE | TABELA              | SERVICE   | PROFILE         | SERVICE_TYPE   | CLIENT_TYPE | QTD |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | BAVIVONOITEGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | LIVREGOSPELGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGNOITEGSM      | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGRESPREGSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGVIVODIAGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRALTOVAL1GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | NEMAISMSGGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRVIVOTODAGSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJPREDIAR3GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSVIVODIAGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSMAISMSGGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | TCOVIVODIAGSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | TCOVIVOTODAGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | TCOLIVREGSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | BAALTOVAL2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGCONTROLGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | NEVIVOTODAGSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRVIVONOITEGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRPREDIAR3GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJBASICOGSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRPREDADOGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJVIVOTODAGSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJPREDIAR2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSVIVONOITEGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSVIVOTODAGSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | SPRESPREGSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | TCOPREDIAR2GSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | VIVODIAGSM      | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | BAMAISMSGGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGPREDIAR2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | BAPREDADOGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | BAPREDIAR3GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | NEPREDIARIOGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | NEPREDIAR3GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRVIVODIAGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSTODAGSM       | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSDIAGSM        | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | TCOALTOVAL1GSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | SPPREDIAR3GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | SPPREDIARIOGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | VIVOTODAGSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | BAVIVOTODAGSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | BARESPREGSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | NEALTOVAL2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | NEVIVODIAGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | NEVIVONOITEGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | NEPREDADOGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJDIAGSM        | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSALTOVAL2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJMAISMSGGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJRESPREGSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSPREDIARIOGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJPREDIARIOGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | NEPREDIAR2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRPREDIAR2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | JOVEMGSM        | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGVIVOTODAGSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGALTOVAL2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | NEALTOVAL1GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGFLEX85GSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGCTRLEMPGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRALTOVAL2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRLIVRE1GSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJALTOVAL2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRMAISMSGGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJPREDADOGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | SPALTOVAL2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | SPPREDADOGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | TCOALTOVAL2GSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | BADIAGSM        | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | BAPREDIAR2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | BAPREDIARIOGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | BAVIVODIAGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGPREDADOGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGMAISMSGGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRJOVEMGSM      | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRRESPREGSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJALTOVAL1GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJVIVONOITEGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSPREDIAR3GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSNOITEGSM      | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | TCOMAISMSGGSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | TCOPREDADOGSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | TCOPREDIAR3GSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRPREDIARIOGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | LIVREMTVGSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | LIVREGSM        | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | NERESPREGSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRBASICOGSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJTODAGSM       | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSALTOVAL1GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSPREDIAR2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | SPMAISMSGGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | SPALTOVAL1GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | TCORESPREGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | TCOPREDIARIOGSM | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | VIVONOITEGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJVIVODIAGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | BAALTOVAL1GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | GOLGSM          | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | BASICOGSM       | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGVIVONOITEGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGALTOVAL1GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGFLEX45GSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | PRLIVREGSM      | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSBASICOGSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RJNOITEGSM      | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSPREDADOGSM    | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | RSRESPREGSM     | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | SPPREDIAR2GSM   | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | TCOVIVONOITEGSM | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGPREDIARIOGSM  | <SERVICE_TYPE> | 7           | 1   |
    | SELECT | BDA  | SRV_SERVICE_PROFILE | <SERVICE> | MGPREDIAR3GSM   | <SERVICE_TYPE> | 7           | 1   |

  Exemplos:
  | testcase | SERVICE         | SERVICE_TYPE |
  | TC-0001  | SRV_TARIFA_VT19 | ADITIONAL    | 
  | TC-0002  | CAD_ALARM_VT19  | ADITIONAL    | 
  | TC-0003  | CCA_CAD_884     | INTERNAL     | 
  | TC-0004  | SRV_ACT_RF_VT19 | REFRESH      |
  | TC-0005  | PCK_VT_CMB_884  | PACK_DATA    |
  | TC-0006  | SRV_SVA_PRE11   | INTERNAL     |
  | TC-0007  | PCT_CMB_VT19DEG | PACK_DATA    |
  | TC-0008  | PCT_CMB_VT19MSL | PACK_DATA    |




@Banco @ID-0038 @life_cycle
 Esquema do Cenario: Validação tabela SRV_SERVICE_PROPERTIES
 Dado o número do caso de teste "<testcase>" 
  Então valido a consulta com os parametros:  
    | BASE | TIPO   | TABELA                 | SERVICE  | PROPERTY   | PROFILE          |  QTD |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | BAVIVONOITEGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | LIVREGOSPELGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGNOITEGSM       |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGRESPREGSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGVIVODIAGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRALTOVAL1GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | NEMAISMSGGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRVIVOTODAGSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJPREDIAR3GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSVIVODIAGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSMAISMSGGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | TCOVIVODIAGSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | TCOVIVOTODAGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | TCOLIVREGSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | BAALTOVAL2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGCONTROLGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | NEVIVOTODAGSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRVIVONOITEGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRPREDIAR3GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJBASICOGSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRPREDADOGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJVIVOTODAGSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJPREDIAR2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSVIVONOITEGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSVIVOTODAGSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | SPRESPREGSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | TCOPREDIAR2GSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | VIVODIAGSM       |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | BAMAISMSGGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGPREDIAR2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | BAPREDADOGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | BAPREDIAR3GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | NEPREDIARIOGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | NEPREDIAR3GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRVIVODIAGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSTODAGSM        |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSDIAGSM         |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | TCOALTOVAL1GSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | SPPREDIAR3GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | SPPREDIARIOGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | VIVOTODAGSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | BAVIVOTODAGSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | BARESPREGSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | NEALTOVAL2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | NEVIVODIAGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | NEVIVONOITEGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | NEPREDADOGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJDIAGSM         |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSALTOVAL2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJMAISMSGGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJRESPREGSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSPREDIARIOGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJPREDIARIOGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | NEPREDIAR2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRPREDIAR2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | JOVEMGSM         |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGVIVOTODAGSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGALTOVAL2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | NEALTOVAL1GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGFLEX85GSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGCTRLEMPGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRALTOVAL2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRLIVRE1GSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJALTOVAL2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRMAISMSGGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJPREDADOGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | SPALTOVAL2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | SPPREDADOGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | TCOALTOVAL2GSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | BADIAGSM         |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | BAPREDIAR2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | BAPREDIARIOGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | BAVIVODIAGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGPREDADOGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGMAISMSGGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRJOVEMGSM       |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRRESPREGSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJALTOVAL1GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJVIVONOITEGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSPREDIAR3GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSNOITEGSM       |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | TCOMAISMSGGSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | TCOPREDADOGSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | TCOPREDIAR3GSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRPREDIARIOGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | LIVREMTVGSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | LIVREGSM         |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | NERESPREGSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRBASICOGSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJTODAGSM        |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSALTOVAL1GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSPREDIAR2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | SPMAISMSGGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | SPALTOVAL1GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | TCORESPREGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | TCOPREDIARIOGSM  |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | VIVONOITEGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJVIVODIAGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | BAALTOVAL1GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | GOLGSM           |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | BASICOGSM        |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGVIVONOITEGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGALTOVAL1GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGFLEX45GSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | PRLIVREGSM       |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSBASICOGSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RJNOITEGSM       |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSPREDADOGSM     |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | RSRESPREGSM      |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | SPPREDIAR2GSM    |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | TCOVIVONOITEGSM  |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGPREDIARIOGSM   |   1  |
    | BDA  | SELECT | SRV_SERVICE_PROPERTIES |<SERVICE> | <PROPERTY> | MGPREDIAR3GSM    |   1  |

#CCA_CAD_884 
#PCK_VT_CMB_884 
  Exemplos:
  | testcase | SERVICE        | PROPERTY        |
  | TC-0001  | CAD_ALARM_VT19 |  HADA           |
  | TC-0002  | SRV_TARIFA_VT19|  HADA           |
  | TC-0003  | SRV_ACT_RF_VT19|  REFRESH        |
  | TC-0004  | SRV_SVA_PRE11  |  HADA           |
  | TC-0005  | PCT_CMB_VT19MSL|  ACM_SERVICE    |
  | TC-0006  | PCT_CMB_VT19MSL|  INHERITED_PARAM|
  | TC-0007  | PCT_CMB_VT19MSL|  NO_CONT_FTM    |
  | TC-0008  | PCT_CMB_VT19DEG|  ACM_SERVICE    |
  



@Banco @ID-0039 @life_cycle
 Esquema do Cenario: Validação tabela SRV_SERVICE_REVALIDATION
 Dado o número do caso de teste "<testcase>" 
  Então valido a consulta com os parametros:  
    | BASE | TIPO   | TABELA                   | SERVICE  | PROFILE          | VALIDATION_REASON   | REVAL_PERIOD   | VALIDATION_ERROR   | QTD |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | BAVIVONOITEGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | LIVREGOSPELGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGNOITEGSM       | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGRESPREGSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGVIVODIAGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRALTOVAL1GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | NEMAISMSGGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRVIVOTODAGSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJPREDIAR3GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSVIVODIAGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSMAISMSGGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | TCOVIVODIAGSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | TCOVIVOTODAGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | TCOLIVREGSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | BAALTOVAL2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGCONTROLGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | NEVIVOTODAGSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRVIVONOITEGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRPREDIAR3GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJBASICOGSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRPREDADOGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJVIVOTODAGSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJPREDIAR2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSVIVONOITEGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSVIVOTODAGSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | SPRESPREGSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | TCOPREDIAR2GSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | VIVODIAGSM       | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | BAMAISMSGGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGPREDIAR2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | BAPREDADOGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | BAPREDIAR3GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | NEPREDIARIOGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | NEPREDIAR3GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRVIVODIAGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSTODAGSM        | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSDIAGSM         | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | TCOALTOVAL1GSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | SPPREDIAR3GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | SPPREDIARIOGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | VIVOTODAGSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | BAVIVOTODAGSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | BARESPREGSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | NEALTOVAL2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | NEVIVODIAGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | NEVIVONOITEGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | NEPREDADOGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJDIAGSM         | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSALTOVAL2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJMAISMSGGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJRESPREGSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSPREDIARIOGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJPREDIARIOGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | NEPREDIAR2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRPREDIAR2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | JOVEMGSM         | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGVIVOTODAGSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGALTOVAL2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | NEALTOVAL1GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGFLEX85GSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGCTRLEMPGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRALTOVAL2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRLIVRE1GSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJALTOVAL2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRMAISMSGGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJPREDADOGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | SPALTOVAL2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | SPPREDADOGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | TCOALTOVAL2GSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | BADIAGSM         | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | BAPREDIAR2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | BAPREDIARIOGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | BAVIVODIAGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGPREDADOGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGMAISMSGGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRJOVEMGSM       | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRRESPREGSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJALTOVAL1GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJVIVONOITEGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSPREDIAR3GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSNOITEGSM       | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | TCOMAISMSGGSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | TCOPREDADOGSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | TCOPREDIAR3GSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRPREDIARIOGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | LIVREMTVGSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | LIVREGSM         | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | NERESPREGSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRBASICOGSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJTODAGSM        | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSALTOVAL1GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSPREDIAR2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | SPMAISMSGGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | SPALTOVAL1GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | TCORESPREGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | TCOPREDIARIOGSM  | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | VIVONOITEGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJVIVODIAGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | BAALTOVAL1GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | GOLGSM           | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | BASICOGSM        | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGVIVONOITEGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGALTOVAL1GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGFLEX45GSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | PRLIVREGSM       | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSBASICOGSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RJNOITEGSM       | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSPREDADOGSM     | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | RSRESPREGSM      | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | SPPREDIAR2GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | TCOVIVONOITEGSM  | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGPREDIARIOGSM   | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |
    | BDA  | SELECT | SRV_SERVICE_REVALIDATION |<SERVICE> | MGPREDIAR3GSM    | <VALIDATION_REASON> | <REVAL_PERIOD> | <VALIDATION_ERROR> | 1  |

Exemplos:
  | testcase | SERVICE        | REVAL_PERIOD            | VALIDATION_REASON | VALIDATION_ERROR |
  | TC-0001  | PCT_CMB_VT19MSL|  SRV_PARAM.REVAL_PERIOD |  71               | 161207           |
 


@Banco @ID-0040 @life_cycle
 Esquema do Cenario: Validação tabela SRV_SERVICE_REVAL_STATE
 Dado o número do caso de teste "<testcase>" 
 Então valido a consulta com os parametros:  
  | BASE | TIPO   | TABELA                  |  SERVICE  | PROFILE          | ACC_STATE   |QTD |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | BAVIVONOITEGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | LIVREGOSPELGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGNOITEGSM       | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGRESPREGSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGVIVODIAGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRALTOVAL1GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | NEMAISMSGGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRVIVOTODAGSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJPREDIAR3GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSVIVODIAGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSMAISMSGGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | TCOVIVODIAGSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | TCOVIVOTODAGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | TCOLIVREGSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | BAALTOVAL2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGCONTROLGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | NEVIVOTODAGSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRVIVONOITEGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRPREDIAR3GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJBASICOGSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRPREDADOGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJVIVOTODAGSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJPREDIAR2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSVIVONOITEGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSVIVOTODAGSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | SPRESPREGSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | TCOPREDIAR2GSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | VIVODIAGSM       | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | BAMAISMSGGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGPREDIAR2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | BAPREDADOGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | BAPREDIAR3GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | NEPREDIARIOGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | NEPREDIAR3GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRVIVODIAGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSTODAGSM        | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSDIAGSM         | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | TCOALTOVAL1GSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | SPPREDIAR3GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | SPPREDIARIOGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | VIVOTODAGSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | BAVIVOTODAGSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | BARESPREGSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | NEALTOVAL2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | NEVIVODIAGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | NEVIVONOITEGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | NEPREDADOGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJDIAGSM         | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSALTOVAL2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJMAISMSGGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJRESPREGSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSPREDIARIOGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJPREDIARIOGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | NEPREDIAR2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRPREDIAR2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | JOVEMGSM         | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGVIVOTODAGSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGALTOVAL2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | NEALTOVAL1GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGFLEX85GSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGCTRLEMPGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRALTOVAL2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRLIVRE1GSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJALTOVAL2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRMAISMSGGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJPREDADOGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | SPALTOVAL2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | SPPREDADOGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | TCOALTOVAL2GSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | BADIAGSM         | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | BAPREDIAR2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | BAPREDIARIOGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | BAVIVODIAGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGPREDADOGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGMAISMSGGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRJOVEMGSM       | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRRESPREGSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJALTOVAL1GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJVIVONOITEGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSPREDIAR3GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSNOITEGSM       | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | TCOMAISMSGGSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | TCOPREDADOGSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | TCOPREDIAR3GSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRPREDIARIOGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | LIVREMTVGSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | LIVREGSM         | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | NERESPREGSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRBASICOGSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJTODAGSM        | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSALTOVAL1GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSPREDIAR2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | SPMAISMSGGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | SPALTOVAL1GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | TCORESPREGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | TCOPREDIARIOGSM  | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | VIVONOITEGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJVIVODIAGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | BAALTOVAL1GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | GOLGSM           | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | BASICOGSM        | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGVIVONOITEGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGALTOVAL1GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGFLEX45GSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | PRLIVREGSM       | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSBASICOGSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RJNOITEGSM       | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSPREDADOGSM     | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | RSRESPREGSM      | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | SPPREDIAR2GSM    | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | TCOVIVONOITEGSM  | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGPREDIARIOGSM   | <ACC_STATE> | 1  |
  | BDA  | SELECT | SRV_SERVICE_REVAL_STATE | <SERVICE> | MGPREDIAR3GSM    | <ACC_STATE> | 1  |


  Exemplos:
  | testcase | SERVICE          | ACC_STATE |
  | TC-0001  | PCT_CMB_VT19_MSL |  1        |
  | TC-0001  | PCT_CMB_VT19_MSL |  2        |
  | TC-0001  | PCT_CMB_VT19_MSL |  3        |
  | TC-0001  | PCT_CMB_VT19_MSL |  12       |
  



@Banco @ID-0041 @life_cycle
  Esquema do Cenario: Validar config na PAY_CFG_GENERIC_RULE
  Dado o número do caso de teste "<testcase>"
  Então valido a consulta com os parametros:
   | BASE | TIPO   | TABELA               |  SEARCH_INFO2  | SEARCH_INFO1 | SEARCH_INFO3 | QTD |
   | BDA  | SELECT | PAY_CFG_GENERIC_RULE | <SEARCH_INFO2> |    DESTINY   |      ACT     |  1  |
   | BDA  | SELECT | PAY_CFG_GENERIC_RULE | <SEARCH_INFO2> |    DESTINY   |      SUS     |  1  |
   | BDA  | SELECT | PAY_CFG_GENERIC_RULE | <SEARCH_INFO2> |    ORIGIN    |      ACT     |  1  |
   | BDA  | SELECT | PAY_CFG_GENERIC_RULE | <SEARCH_INFO2> |    ORIGIN    |      SUS     |  1  |
   
  Exemplos:
    | testcase | SEARCH_INFO2    |
    | TC-0001  | PCT_CMB_VT19MSL |




@Banco @ID-0042 @life_cycle
  Esquema do Cenario:   Validar VT 884 - tabela PAY_CFG_ORIGIN_GROUP_MAP
  ##Template de apoio: PrePago_T266545_CFG563841_Originador_Saldo_OfertasMensal_884_20.2.0
  Dado o número do caso de teste "<testcase>"

    Então valido a consulta com os parametros:
      | TIPO   | BASE | TABELA                   | ORIGIN_ID       | PLAFOND_TYPE | ORIGIN_GROUP | PRIORITY | QTD |
      | SELECT | BDA  | PAY_CFG_ORIGIN_GROUP_MAP | PCK_VT_CMB_884  |      149     |  7           | 100      |  1  |
      | SELECT | BDA  | PAY_CFG_ORIGIN_GROUP_MAP | PCT_CMB_VT19DEG |      81      |  10          | 100      |  1  |
      | SELECT | BDA  | PAY_CFG_ORIGIN_GROUP_MAP | PCT_CMB_VT19MSL |      81      |  10          | 100      |  1  |

    Exemplos:
      | testcase  | 
      |  TC-0001  | 
         




@Banco @ID-0043 @promotion
   Esquema do Cenario:  Validar VT 884 - tabela LFC_CFG_ENTITY
   Dado o número do caso de teste "<testcase>"
  #Template: PrePago_T86008_CFG563824_Servicos_884_20.2.0 / PrePago_T86008_CFG563828_Servicos_VivoTurboRefreshVTMensal_884_v20.2.0 / PrePago_T86008_CFG563826_Servicos_VivoTurbo_SVA_v20.2.0 ABA: CICLO DE VIDA 
   E valido a consulta com os parametros:
    | TIPO   | BASE | TABELA         | ATT2            | ID   | CONFIG_AREA |  QTD  |
    | SELECT | BDA  | LFC_CFG_ENTITY | SRV_SVA_PRE11   | 5046 |    VIVO     |   1   |
    | SELECT | BDA  | LFC_CFG_ENTITY | SRV_TARIFA_VT19 | 5046 |    VIVO     |   1   |
    | SELECT | BDA  | LFC_CFG_ENTITY | CAD_ALARM_VT19  | 5005 |    VIVO     |   1   |
    | SELECT | BDA  | LFC_CFG_ENTITY | SRV_ACT_RF_VT19 | 5044 |    VIVO     |   1   |
    | SELECT | BDA  | LFC_CFG_ENTITY | CCA_CAD_884     | 5001 |    VIVO     |   1   |
    | SELECT | BDA  | LFC_CFG_ENTITY | PCT_CMB_VT19MSL | 5025 |    VIVO     |   1   |
    | SELECT | BDA  | LFC_CFG_ENTITY | PCT_CMB_VT19DEG | 5023 |    VIVO     |   1   |

  Exemplos:
    | testcase | 
    | TC-0001  | 




@Banco @ID-0044 @life_cycle
  Esquema do Cenario: Validar tabela ICO_SMINT_MAP_SUBSERVICE
  #Template: PrePago_T86008_CFG563824_Servicos_884_20.2.0 / PrePago_T86008_CFG563828_Servicos_VivoTurboRefreshVTMensal_884_v20.2.0 / PrePago_T86008_CFG563826_Servicos_VivoTurbo_SVA_v20.2.0 ABA: SERVICOS 
  Dado o número do caso de teste "<testcase>"
  Então valido a consulta com os parametros:
    | TIPO   | BASE | TABELA                   | CODE_CARE   | CODE_CORE   | CLIENT_TYPE | OPERATOR | QTD |
    | SELECT | BDA  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     1    |  1  |
    | SELECT | BDA  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     2    |  1  |
    | SELECT | BDA  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     3    |  1  |
    | SELECT | BDA  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     4    |  1  |  
    | SELECT | BDA  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     5    |  1  |
    | SELECT | BDA  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     6    |  1  |
    | SELECT | BDA  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     7    |  1  |      
    | SELECT | BDA  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     8    |  1  |
    | SELECT | BDB  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     1    |  1  |
    | SELECT | BDB  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     2    |  1  |
    | SELECT | BDB  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     3    |  1  |
    | SELECT | BDB  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     4    |  1  |  
    | SELECT | BDB  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     5    |  1  |
    | SELECT | BDB  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     6    |  1  |
    | SELECT | BDB  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     7    |  1  |      
    | SELECT | BDB  | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     8    |  1  |
    | SELECT | BDRT | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     1    |  1  |
    | SELECT | BDRT | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     2    |  1  |
    | SELECT | BDRT | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     3    |  1  |
    | SELECT | BDRT | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     4    |  1  |  
    | SELECT | BDRT | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     5    |  1  |
    | SELECT | BDRT | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     6    |  1  |
    | SELECT | BDRT | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     7    |  1  |      
    | SELECT | BDRT | ICO_SMINT_MAP_SUBSERVICE | <CODE_CARE> | <CODE_CORE> |      7      |     8    |  1  |

  Exemplos:
    | testcase | SERVICE |   CODE_CARE     | CODE_CORE |
    | TC-0001  |  PRE    | SRV_TARIFA_VT19 | 102       | 
    | TC-0002  |  PRE    | CAD_ALARM_VT19  | 103       |
    | TC-0003  |  PRE    | CCA_CAD_884     | 2232      | 
    | TC-0004  |  PRE    | SRV_ACT_RF_VT19 | 2227      | 
    | TC-0005  |  PRE    | SRV_SVA_PRE11   | 2228      |
    | TC-0006  |  PRE    | PCK_VT_CMB_884  | 2231      | 
    | TC-0007  |  PRE    | PCT_CMB_VT19MSL | 2229      |
    | TC-0008  |  PRE    | PCT_CMB_VT19DEG | 2230      |




@Banco @ID-0045 @life_cycle 
 # Valores obtidos pelo espelho DATA_PACK_BDSEM
 # Aba MAPEAMENTO_PLAFOND do template PrePago_T258349_CFG564237_SimplicacaoExtratoDetalhado_AlavancagemStepDown_20.2.0
 Esquema do Cenario: Verificar Operações na UIB_GER_MAPPING_PROPERTY
 Dado o número do caso de teste "<testcase>"
 Então valido a consulta com os parametros:
    | BASE | TIPO   | TABELA                   | MAPPING_CODE   | MAPPING_PROPERTY_NAME | MAPPING_PROPERTY_VALUE | QTD |
    | BDA  | SELECT | UIB_GER_MAPPING_PROPERTY | PCK_VT_CMB_884 | PLAFOND_TYPE          | BCC                    |  1  |
    | BDA  | SELECT | UIB_GER_MAPPING_PROPERTY | PCK_VT_CMB_884 | PLAFOND_VALUE         | AVL                    |  1  |
    | BDA  | SELECT | UIB_GER_MAPPING_PROPERTY | PCK_VT_CMB_884 | SUBSCRIPTION_TYPE     | 0                      |  1  |
    | BDA  | SELECT | UIB_GER_MAPPING_PROPERTY | PCT_CMB_VT19MSL| PLAFOND_TYPE          | DPN                    |  1  |
    | BDA  | SELECT | UIB_GER_MAPPING_PROPERTY | PCT_CMB_VT19MSL| PLAFOND_VALUE         | 800                    |  1  |
    | BDA  | SELECT | UIB_GER_MAPPING_PROPERTY | PCT_CMB_VT19MSL| SUBSCRIPTION_TYPE     | DGT                    |  1  |
    | BDA  | SELECT | UIB_GER_MAPPING_PROPERTY | PCT_CMB_VT19DEG| PLAFOND_TYPE          | DPN                    |  1  |
    | BDA  | SELECT | UIB_GER_MAPPING_PROPERTY | PCT_CMB_VT19DEG| PLAFOND_VALUE         | 800                    |  1  |
    | BDA  | SELECT | UIB_GER_MAPPING_PROPERTY | PCT_CMB_VT19DEG| SUBSCRIPTION_TYPE     | DGT                    |  1  |
 # BDB
 Então valido a consulta com os parametros:
    | BASE | TIPO   | TABELA                   | MAPPING_CODE   | MAPPING_PROPERTY_NAME | MAPPING_PROPERTY_VALUE | QTD |
    | BDB  | SELECT | UIB_GER_MAPPING_PROPERTY | PCK_VT_CMB_884 | PLAFOND_TYPE          | BCC                    |  1  |
    | BDB  | SELECT | UIB_GER_MAPPING_PROPERTY | PCK_VT_CMB_884 | PLAFOND_VALUE         | AVL                    |  1  |
    | BDB  | SELECT | UIB_GER_MAPPING_PROPERTY | PCK_VT_CMB_884 | SUBSCRIPTION_TYPE     | 0                      |  1  |
    | BDB  | SELECT | UIB_GER_MAPPING_PROPERTY | PCT_CMB_VT19MSL| PLAFOND_TYPE          | DPN                    |  1  |
    | BDB  | SELECT | UIB_GER_MAPPING_PROPERTY | PCT_CMB_VT19MSL| PLAFOND_VALUE         | 800                    |  1  |
    | BDB  | SELECT | UIB_GER_MAPPING_PROPERTY | PCT_CMB_VT19MSL| SUBSCRIPTION_TYPE     | DGT                    |  1  |
    | BDB  | SELECT | UIB_GER_MAPPING_PROPERTY | PCT_CMB_VT19DEG| PLAFOND_TYPE          | DPN                    |  1  |
    | BDB  | SELECT | UIB_GER_MAPPING_PROPERTY | PCT_CMB_VT19DEG| PLAFOND_VALUE         | 800                    |  1  |
    | BDB  | SELECT | UIB_GER_MAPPING_PROPERTY | PCT_CMB_VT19DEG| SUBSCRIPTION_TYPE     | DGT                    |  1  |
 
 Exemplos: 
    | testcase | 
    | TC-0001  | 


 
@Banco @ID-0046 @promotion
  # Aba PACOTES do PrePago_T86009_CFG563830_Pacotes_884_20.2.1
  Esquema do Cenario: Validar tabelas UIB_GER_MAPPING 
  Dado o número do caso de teste "<testcase>"
  Então valido a consulta com os parametros:
  | BASE | TIPO   | TABELA          | MAPPING_CODE     | MAPPING_DESCRIPTION     | QTD |
  | BDA  | SELECT | UIB_GER_MAPPING | PCT_CMB_VT19DEG  | Vivo Turbo 15 dias Deg. | 1   |
  | BDB  | SELECT | UIB_GER_MAPPING | PCT_CMB_VT19MSL  | Vivo Turbo 15 dias      | 1   |
  Exemplos: 
  | testcase | 
  | TC-0001  | 




@Banco @ID-0047 @life_cycle
   Esquema do Cenario:   Validar VT 884 - tabela PAY_CFG_PLAFOND_ORIGIN_DESC
   #PrePago_T266545_CFG563841_Originador_Saldo_OfertasMensal_884_20.2.0
   Dado o número do caso de teste "<testcase>"
   Então valido a consulta com os parametros:
    | TIPO   | BASE | TABELA                      | ORIGIN_ID       | DESCRIPTION                                   | PLAFOND_TYPE | CLIENT_TYPE | PROFILE | PRIORITY | QTD |
    | SELECT | BDA  | PAY_CFG_PLAFOND_ORIGIN_DESC | PCK_VT_CMB_884  | Vivo Turbo 15 dias em Dobro 6 meses           | 149          | 7           | *       | 100      | 1   |
    | SELECT | BDA  | PAY_CFG_PLAFOND_ORIGIN_DESC | PCT_CMB_VT19DEG | Vivo Turbo 15 dias Deg - Franquia Internet    | 81           | 7           | *       | 100      | 1   |
    | SELECT | BDA  | PAY_CFG_PLAFOND_ORIGIN_DESC | PCT_CMB_VT19DEG | Vivo Turbo 15 dias - Franquia Minutos on-net  | 72           | 7           | *       | 100      | 1   |
    | SELECT | BDA  | PAY_CFG_PLAFOND_ORIGIN_DESC | PCT_CMB_VT19DEG | Vivo Turbo 15 dias - SMS/MMS                  | 73           | 7           | *       | 100      | 1   |
    | SELECT | BDA  | PAY_CFG_PLAFOND_ORIGIN_DESC | PCT_CMB_VT19DEG | Vivo Turbo 15 dias - SMS/MMS off net          | 69           | 7           | *       | 100      | 1   |
    | SELECT | BDA  | PAY_CFG_PLAFOND_ORIGIN_DESC | PCT_CMB_VT19DEG | Vivo Turbo 15 dias - Franquia Minutos off-net | 68           | 7           | *       | 100      | 1   |
    | SELECT | BDA  | PAY_CFG_PLAFOND_ORIGIN_DESC | PCT_CMB_VT19MSL | Vivo Turbo 15 dias - Franquia Minutos on-net  | 72           | 7           | *       | 100      | 1   |
    | SELECT | BDA  | PAY_CFG_PLAFOND_ORIGIN_DESC | PCT_CMB_VT19MSL | Vivo Turbo 15 dias - SMS/MMS                  | 73           | 7           | *       | 100      | 1   |
    | SELECT | BDA  | PAY_CFG_PLAFOND_ORIGIN_DESC | PCT_CMB_VT19MSL | Vivo Turbo 15 dias - SMS/MMS off net          | 69           | 7           | *       | 100      | 1   |
    | SELECT | BDA  | PAY_CFG_PLAFOND_ORIGIN_DESC | PCT_CMB_VT19MSL | Vivo Turbo 15 dias - Franquia Minutos off-net | 68           | 7           | *       | 100      | 1   |
    | SELECT | BDA  | PAY_CFG_PLAFOND_ORIGIN_DESC | PCT_CMB_VT19MSL | Vivo Turbo 15 dias - Franquia Internet        | 81           | 7           | *       | 100      | 1   |

    Exemplos:
      | testcase |  
      |  TC-0001 | 





@Banco @ID-0048 @life_cycle
   Esquema do Cenario: Validar VT 884 - tabela SRV_CFG_REASON_SERVICE
   #TODO: APARENTEMENTE SEM TEMPLATE ASSOCIADO
   Dado o número do caso de teste "<testcase>"
   Então valido a consulta com os parametros:
    | BASE | TIPO   | TABELA                 | REASON_CODE | SERVICE        | QTD  |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 4493        | CAD_ALARM_VT19 |  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 4494        | CAD_ALARM_VT19 |  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 4495        | CAD_ALARM_VT19 |  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 4496        | SRV_TARIFA_VT19|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 4497        | SRV_TARIFA_VT19|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 4498        | SRV_TARIFA_VT19|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 4499        | SRV_TARIFA_VT19|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 6624        | CCA_CAD_884    |  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 6625        | CCA_CAD_884    |  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 6626        | CCA_CAD_884    |  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 4500        | SRV_ACT_RF_VT19|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 4501        | SRV_ACT_RF_VT19|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 4502        | SRV_ACT_RF_VT19|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 9455        | PCK_VT_CMB_884 |  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 9456        | PCK_VT_CMB_884 |  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 9457        | PCK_VT_CMB_884 |  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 6553        | PCT_CMB_VT19MSL|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 6554        | PCT_CMB_VT19MSL|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 6555        | PCT_CMB_VT19MSL|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 6556        | PCT_CMB_VT19MSL|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 6557        | PCT_CMB_VT19MSL|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 6559        | PCT_CMB_VT19DEG|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 6560        | PCT_CMB_VT19DEG|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 6561        | PCT_CMB_VT19DEG|  1   |
    | BDA  | SELECT | SRV_CFG_REASON_SERVICE | 6562        | PCT_CMB_VT19DEG|  1   |

   Exemplos:
    | testcase |
    | TC-00001 |
 




@Banco @ID-0049 @life_cycle
  Esquema do Cenario: TARGET grupo DDDs - (Nacional)
  Dado o número do caso de teste "<testcase>"
  Então valido a consulta com os parametros:
    | BASE  | TIPO   | TABELA                         | PROFILE   | AREA_CODE   | GROUP_ID   |   QTD |
    | BDA   | SELECT | ACC_CFG_PROFILE_AREA_GROUP     | <PROFILE> | <DDD>       | VT19_GRP_N |    1  |

 Exemplos:
      | testcase | DDD | PROFILE         |
      | TC-0001  | 11  | BASICOGSM       |
      | TC-0002  | 11  | GOLGSM          |
      | TC-0003  | 11  | JOVEMGSM        |
      | TC-0004  | 11  | LIVREGOSPELGSM  |
      | TC-0005  | 11  | LIVREGSM        |
      | TC-0006  | 11  | LIVREMTVGSM     |
      | TC-0007  | 11  | SPALTOVAL1GSM   |
      | TC-0008  | 11  | SPALTOVAL2GSM   |
      | TC-0009  | 11  | SPMAISMSGGSM    |
      | TC-0010  | 11  | SPPREDADOGSM    |
      | TC-0011  | 11  | SPPREDIARIOGSM  |
      | TC-0012  | 11  | SPPREDIAR2GSM   |
      | TC-0013  | 11  | SPPREDIAR3GSM   |
      | TC-0014  | 11  | SPRESPREGSM     |
      | TC-0015  | 11  | VIVODIAGSM      |
      | TC-0016  | 11  | VIVONOITEGSM    |
      | TC-0017  | 11  | VIVOTODAGSM     |
      | TC-0018  | 12  | BASICOGSM       |
      | TC-0019  | 12  | GOLGSM          |
      | TC-0020  | 12  | JOVEMGSM        |
      | TC-0021  | 12  | LIVREGOSPELGSM  |
      | TC-0022  | 12  | LIVREGSM        |
      | TC-0023  | 12  | LIVREMTVGSM     |
      | TC-0024  | 12  | SPALTOVAL1GSM   |
      | TC-0025  | 12  | SPALTOVAL2GSM   |
      | TC-0026  | 12  | SPMAISMSGGSM    |
      | TC-0027  | 12  | SPPREDADOGSM    |
      | TC-0028  | 12  | SPPREDIARIOGSM  |
      | TC-0029  | 12  | SPPREDIAR2GSM   |
      | TC-0030  | 12  | SPPREDIAR3GSM   |
      | TC-0031  | 12  | SPRESPREGSM     |
      | TC-0032  | 12  | VIVODIAGSM      |
      | TC-0033  | 12  | VIVONOITEGSM    |
      | TC-0034  | 12  | VIVOTODAGSM     |
      | TC-0035  | 13  | BASICOGSM       |
      | TC-0036  | 13  | GOLGSM          |
      | TC-0037  | 13  | JOVEMGSM        |
      | TC-0038  | 13  | LIVREGOSPELGSM  |
      | TC-0039  | 13  | LIVREGSM        |
      | TC-0040  | 13  | LIVREMTVGSM     |
      | TC-0041  | 13  | SPALTOVAL1GSM   |
      | TC-0042  | 13  | SPALTOVAL2GSM   |
      | TC-0043  | 13  | SPMAISMSGGSM    |
      | TC-0044  | 13  | SPPREDADOGSM    |
      | TC-0045  | 13  | SPPREDIARIOGSM  |
      | TC-0046  | 13  | SPPREDIAR2GSM   |
      | TC-0047  | 13  | SPPREDIAR3GSM   |
      | TC-0048  | 13  | SPRESPREGSM     |
      | TC-0049  | 13  | VIVODIAGSM      |
      | TC-0050  | 13  | VIVONOITEGSM    |
      | TC-0051  | 13  | VIVOTODAGSM     |
      | TC-0052  | 14  | BASICOGSM       |
      | TC-0053  | 14  | GOLGSM          |
      | TC-0054  | 14  | JOVEMGSM        |
      | TC-0055  | 14  | LIVREGOSPELGSM  |
      | TC-0056  | 14  | LIVREGSM        |
      | TC-0057  | 14  | LIVREMTVGSM     |
      | TC-0058  | 14  | SPALTOVAL1GSM   |
      | TC-0059  | 14  | SPALTOVAL2GSM   |
      | TC-0060  | 14  | SPMAISMSGGSM    |
      | TC-0061  | 14  | SPPREDADOGSM    |
      | TC-0062  | 14  | SPPREDIARIOGSM  |
      | TC-0063  | 14  | SPPREDIAR2GSM   |
      | TC-0064  | 14  | SPPREDIAR3GSM   |
      | TC-0065  | 14  | SPRESPREGSM     |
      | TC-0066  | 14  | VIVODIAGSM      |
      | TC-0067  | 14  | VIVONOITEGSM    |
      | TC-0068  | 14  | VIVOTODAGSM     |
      | TC-0069  | 15  | BASICOGSM       |
      | TC-0070  | 15  | GOLGSM          |
      | TC-0071  | 15  | JOVEMGSM        |
      | TC-0072  | 15  | LIVREGOSPELGSM  |
      | TC-0073  | 15  | LIVREGSM        |
      | TC-0074  | 15  | LIVREMTVGSM     |
      | TC-0075  | 15  | SPALTOVAL1GSM   |
      | TC-0076  | 15  | SPALTOVAL2GSM   |
      | TC-0077  | 15  | SPMAISMSGGSM    |
      | TC-0078  | 15  | SPPREDADOGSM    |
      | TC-0079  | 15  | SPPREDIARIOGSM  |
      | TC-0080  | 15  | SPPREDIAR2GSM   |
      | TC-0081  | 15  | SPPREDIAR3GSM   |
      | TC-0082  | 15  | SPRESPREGSM     |
      | TC-0083  | 15  | VIVODIAGSM      |
      | TC-0084  | 15  | VIVONOITEGSM    |
      | TC-0085  | 15  | VIVOTODAGSM     |
      | TC-0086  | 16  | BASICOGSM       |
      | TC-0087  | 16  | GOLGSM          |
      | TC-0088  | 16  | JOVEMGSM        |
      | TC-0089  | 16  | LIVREGOSPELGSM  |
      | TC-0090  | 16  | LIVREGSM        |
      | TC-0091  | 16  | LIVREMTVGSM     |
      | TC-0092  | 16  | SPALTOVAL1GSM   |
      | TC-0093  | 16  | SPALTOVAL2GSM   |
      | TC-0094  | 16  | SPMAISMSGGSM    |
      | TC-0095  | 16  | SPPREDADOGSM    |
      | TC-0096  | 16  | SPPREDIAR2GSM   |
      | TC-0097  | 16  | SPPREDIAR3GSM   |
      | TC-0098  | 16  | SPPREDIARIOGSM  |
      | TC-0099  | 16  | SPRESPREGSM     |
      | TC-0100  | 16  | VIVODIAGSM      |
      | TC-0101  | 16  | VIVONOITEGSM    |
      | TC-0102  | 16  | VIVOTODAGSM     |
      | TC-0103  | 17  | BASICOGSM       |
      | TC-0104  | 17  | GOLGSM          |
      | TC-0105  | 17  | JOVEMGSM        |
      | TC-0106  | 17  | LIVREGOSPELGSM  |
      | TC-0107  | 17  | LIVREGSM        |
      | TC-0108  | 17  | LIVREMTVGSM     |
      | TC-0109  | 17  | SPALTOVAL1GSM   |
      | TC-0110  | 17  | SPALTOVAL2GSM   |
      | TC-0111  | 17  | SPMAISMSGGSM    |
      | TC-0112  | 17  | SPPREDADOGSM    |
      | TC-0113  | 17  | SPPREDIARIOGSM  |
      | TC-0114  | 17  | SPPREDIAR2GSM   |
      | TC-0115  | 17  | SPPREDIAR3GSM   |
      | TC-0116  | 17  | SPRESPREGSM     |
      | TC-0117  | 17  | VIVODIAGSM      |
      | TC-0118  | 17  | VIVONOITEGSM    |
      | TC-0119  | 17  | VIVOTODAGSM     |
      | TC-0120  | 18  | BASICOGSM       |
      | TC-0121  | 18  | GOLGSM          |
      | TC-0122  | 18  | JOVEMGSM        |
      | TC-0123  | 18  | LIVREGOSPELGSM  |
      | TC-0124  | 18  | LIVREGSM        |
      | TC-0125  | 18  | LIVREMTVGSM     |
      | TC-0126  | 18  | SPALTOVAL1GSM   |
      | TC-0127  | 18  | SPALTOVAL2GSM   |
      | TC-0128  | 18  | SPMAISMSGGSM    |
      | TC-0129  | 18  | SPPREDADOGSM    |
      | TC-0130  | 18  | SPPREDIARIOGSM  |
      | TC-0131  | 18  | SPPREDIAR2GSM   |
      | TC-0132  | 18  | SPPREDIAR3GSM   |
      | TC-0133  | 18  | SPRESPREGSM     |
      | TC-0134  | 18  | VIVODIAGSM      |
      | TC-0135  | 18  | VIVONOITEGSM    |
      | TC-0136  | 18  | VIVOTODAGSM     |
      | TC-0137  | 19  | BASICOGSM       |
      | TC-0138  | 19  | GOLGSM          |
      | TC-0139  | 19  | JOVEMGSM        |
      | TC-0140  | 19  | LIVREGOSPELGSM  |
      | TC-0141  | 19  | LIVREGSM        |
      | TC-0142  | 19  | LIVREMTVGSM     |
      | TC-0143  | 19  | SPALTOVAL1GSM   |
      | TC-0144  | 19  | SPALTOVAL2GSM   |
      | TC-0145  | 19  | SPMAISMSGGSM    |
      | TC-0146  | 19  | SPPREDADOGSM    |
      | TC-0147  | 19  | SPPREDIARIOGSM  |
      | TC-0148  | 19  | SPPREDIAR2GSM   |
      | TC-0149  | 19  | SPPREDIAR3GSM   |
      | TC-0150  | 19  | SPRESPREGSM     |
      | TC-0151  | 19  | VIVODIAGSM      |
      | TC-0152  | 19  | VIVONOITEGSM    |
      | TC-0153  | 19  | VIVOTODAGSM     |
      | TC-0154  | 21  | RJALTOVAL1GSM   |
      | TC-0155  | 21  | RJALTOVAL2GSM   |
      | TC-0156  | 21  | RJBASICOGSM     |
      | TC-0157  | 21  | RJDIAGSM        |
      | TC-0158  | 21  | RJMAISMSGGSM    |
      | TC-0159  | 21  | RJNOITEGSM      |
      | TC-0160  | 21  | RJPREDADOGSM    |
      | TC-0161  | 21  | RJPREDIARIOGSM  |
      | TC-0162  | 21  | RJPREDIAR2GSM   |
      | TC-0163  | 21  | RJPREDIAR3GSM   |
      | TC-0164  | 21  | RJRESPREGSM     |
      | TC-0165  | 21  | RJTODAGSM       |
      | TC-0166  | 21  | RJVIVODIAGSM    |
      | TC-0167  | 21  | RJVIVONOITEGSM  |
      | TC-0168  | 21  | RJVIVOTODAGSM   |
      | TC-0169  | 22  | RJALTOVAL1GSM   |
      | TC-0170  | 22  | RJALTOVAL2GSM   |
      | TC-0171  | 22  | RJBASICOGSM     |
      | TC-0172  | 22  | RJDIAGSM        |
      | TC-0173  | 22  | RJMAISMSGGSM    |
      | TC-0174  | 22  | RJNOITEGSM      |
      | TC-0175  | 22  | RJPREDADOGSM    |
      | TC-0176  | 22  | RJPREDIARIOGSM  |
      | TC-0177  | 22  | RJPREDIAR2GSM   |
      | TC-0178  | 22  | RJPREDIAR3GSM   |
      | TC-0179  | 22  | RJRESPREGSM     |
      | TC-0180  | 22  | RJTODAGSM       |
      | TC-0181  | 22  | RJVIVODIAGSM    |
      | TC-0182  | 22  | RJVIVONOITEGSM  |
      | TC-0183  | 22  | RJVIVOTODAGSM   |
      | TC-0184  | 24  | RJALTOVAL1GSM   |
      | TC-0185  | 24  | RJALTOVAL2GSM   |
      | TC-0186  | 24  | RJBASICOGSM     |
      | TC-0187  | 24  | RJDIAGSM        |
      | TC-0188  | 24  | RJMAISMSGGSM    |
      | TC-0189  | 24  | RJNOITEGSM      |
      | TC-0190  | 24  | RJPREDADOGSM    |
      | TC-0191  | 24  | RJPREDIARIOGSM  |
      | TC-0192  | 24  | RJPREDIAR2GSM   |
      | TC-0193  | 24  | RJPREDIAR3GSM   |
      | TC-0194  | 24  | RJRESPREGSM     |
      | TC-0195  | 24  | RJTODAGSM       |
      | TC-0196  | 24  | RJVIVODIAGSM    |
      | TC-0197  | 24  | RJVIVONOITEGSM  |
      | TC-0198  | 24  | RJVIVOTODAGSM   |
      | TC-0199  | 27  | RJALTOVAL1GSM   |
      | TC-0200  | 27  | RJALTOVAL2GSM   |
      | TC-0201  | 27  | RJBASICOGSM     |
      | TC-0202  | 27  | RJDIAGSM        |
      | TC-0203  | 27  | RJMAISMSGGSM    |
      | TC-0204  | 27  | RJNOITEGSM      |
      | TC-0205  | 27  | RJPREDADOGSM    |
      | TC-0206  | 27  | RJPREDIARIOGSM  |
      | TC-0207  | 27  | RJPREDIAR2GSM   |
      | TC-0208  | 27  | RJPREDIAR3GSM   |
      | TC-0209  | 27  | RJRESPREGSM     |
      | TC-0210  | 27  | RJTODAGSM       |
      | TC-0211  | 27  | RJVIVODIAGSM    |
      | TC-0212  | 27  | RJVIVONOITEGSM  |
      | TC-0213  | 27  | RJVIVOTODAGSM   |
      | TC-0214  | 28  | RJALTOVAL1GSM   |
      | TC-0215  | 28  | RJALTOVAL2GSM   |
      | TC-0216  | 28  | RJBASICOGSM     |
      | TC-0217  | 28  | RJDIAGSM        |
      | TC-0218  | 28  | RJMAISMSGGSM    |
      | TC-0219  | 28  | RJNOITEGSM      |
      | TC-0220  | 28  | RJPREDADOGSM    |
      | TC-0221  | 28  | RJPREDIARIOGSM  |
      | TC-0222  | 28  | RJPREDIAR2GSM   |
      | TC-0223  | 28  | RJPREDIAR3GSM   |
      | TC-0224  | 28  | RJRESPREGSM     |
      | TC-0225  | 28  | RJTODAGSM       |
      | TC-0226  | 28  | RJVIVODIAGSM    |
      | TC-0227  | 28  | RJVIVONOITEGSM  |
      | TC-0228  | 28  | RJVIVOTODAGSM   |
      | TC-0229  | 31  | MGALTOVAL1GSM   |
      | TC-0230  | 31  | MGALTOVAL2GSM   |
      | TC-0231  | 31  | MGCONTROLGSM    |
      | TC-0232  | 31  | MGCTRLEMPGSM    |
      | TC-0233  | 31  | MGFLEX45GSM     |
      | TC-0234  | 31  | MGFLEX85GSM     |
      | TC-0235  | 31  | MGMAISMSGGSM    |
      | TC-0236  | 31  | MGNOITEGSM      |
      | TC-0237  | 31  | MGPREDADOGSM    |
      | TC-0238  | 31  | MGPREDIARIOGSM  |
      | TC-0239  | 31  | MGPREDIAR2GSM   |
      | TC-0240  | 31  | MGPREDIAR3GSM   |
      | TC-0241  | 31  | MGRESPREGSM     |
      | TC-0242  | 31  | MGVIVODIAGSM    |
      | TC-0243  | 31  | MGVIVONOITEGSM  |
      | TC-0244  | 31  | MGVIVOTODAGSM   |
      | TC-0245  | 32  | MGALTOVAL1GSM   |
      | TC-0246  | 32  | MGALTOVAL2GSM   |
      | TC-0247  | 32  | MGCONTROLGSM    |
      | TC-0248  | 32  | MGCTRLEMPGSM    |
      | TC-0249  | 32  | MGFLEX45GSM     |
      | TC-0250  | 32  | MGFLEX85GSM     |
      | TC-0251  | 32  | MGMAISMSGGSM    |
      | TC-0252  | 32  | MGNOITEGSM      |
      | TC-0253  | 32  | MGPREDADOGSM    |
      | TC-0254  | 32  | MGPREDIARIOGSM  |
      | TC-0255  | 32  | MGPREDIAR2GSM   |
      | TC-0256  | 32  | MGPREDIAR3GSM   |
      | TC-0257  | 32  | MGRESPREGSM     |
      | TC-0258  | 32  | MGVIVODIAGSM    |
      | TC-0259  | 32  | MGVIVONOITEGSM  |
      | TC-0260  | 32  | MGVIVOTODAGSM   |
      | TC-0261  | 33  | MGALTOVAL1GSM   |
      | TC-0262  | 33  | MGALTOVAL2GSM   |
      | TC-0263  | 33  | MGCONTROLGSM    |
      | TC-0264  | 33  | MGCTRLEMPGSM    |
      | TC-0265  | 33  | MGFLEX45GSM     |
      | TC-0266  | 33  | MGFLEX85GSM     |
      | TC-0267  | 33  | MGMAISMSGGSM    |
      | TC-0268  | 33  | MGNOITEGSM      |
      | TC-0269  | 33  | MGPREDADOGSM    |
      | TC-0270  | 33  | MGPREDIARIOGSM  |
      | TC-0271  | 33  | MGPREDIAR2GSM   |
      | TC-0272  | 33  | MGPREDIAR3GSM   |
      | TC-0273  | 33  | MGRESPREGSM     |
      | TC-0274  | 33  | MGVIVODIAGSM    |
      | TC-0275  | 33  | MGVIVONOITEGSM  |
      | TC-0276  | 33  | MGVIVOTODAGSM   |
      | TC-0277  | 34  | MGALTOVAL1GSM   |
      | TC-0278  | 34  | MGALTOVAL2GSM   |
      | TC-0279  | 34  | MGCONTROLGSM    |
      | TC-0280  | 34  | MGCTRLEMPGSM    |
      | TC-0281  | 34  | MGFLEX45GSM     |
      | TC-0282  | 34  | MGFLEX85GSM     |
      | TC-0283  | 34  | MGMAISMSGGSM    |
      | TC-0284  | 34  | MGNOITEGSM      |
      | TC-0285  | 34  | MGPREDADOGSM    |
      | TC-0286  | 34  | MGPREDIARIOGSM  |
      | TC-0287  | 34  | MGPREDIAR2GSM   |
      | TC-0288  | 34  | MGPREDIAR3GSM   |
      | TC-0289  | 34  | MGRESPREGSM     |
      | TC-0290  | 34  | MGVIVODIAGSM    |
      | TC-0291  | 34  | MGVIVONOITEGSM  |
      | TC-0292  | 34  | MGVIVOTODAGSM   |
      | TC-0293  | 35  | MGALTOVAL1GSM   |
      | TC-0294  | 35  | MGALTOVAL2GSM   |
      | TC-0295  | 35  | MGCONTROLGSM    |
      | TC-0296  | 35  | MGCTRLEMPGSM    |
      | TC-0297  | 35  | MGFLEX45GSM     |
      | TC-0298  | 35  | MGFLEX85GSM     |
      | TC-0299  | 35  | MGMAISMSGGSM    |
      | TC-0300  | 35  | MGNOITEGSM      |
      | TC-0301  | 35  | MGPREDADOGSM    |
      | TC-0302  | 35  | MGPREDIARIOGSM  |
      | TC-0303  | 35  | MGPREDIAR2GSM   |
      | TC-0304  | 35  | MGPREDIAR3GSM   |
      | TC-0305  | 35  | MGRESPREGSM     |
      | TC-0306  | 35  | MGVIVODIAGSM    |
      | TC-0307  | 35  | MGVIVONOITEGSM  |
      | TC-0308  | 35  | MGVIVOTODAGSM   |
      | TC-0309  | 37  | MGALTOVAL1GSM   |
      | TC-0310  | 37  | MGALTOVAL2GSM   |
      | TC-0311  | 37  | MGCONTROLGSM    |
      | TC-0312  | 37  | MGCTRLEMPGSM    |
      | TC-0313  | 37  | MGFLEX45GSM     |
      | TC-0314  | 37  | MGFLEX85GSM     |
      | TC-0315  | 37  | MGMAISMSGGSM    |
      | TC-0316  | 37  | MGNOITEGSM      |
      | TC-0317  | 37  | MGPREDADOGSM    |
      | TC-0318  | 37  | MGPREDIARIOGSM  |
      | TC-0319  | 37  | MGPREDIAR2GSM   |
      | TC-0320  | 37  | MGPREDIAR3GSM   |
      | TC-0321  | 37  | MGRESPREGSM     |
      | TC-0322  | 37  | MGVIVODIAGSM    |
      | TC-0323  | 37  | MGVIVONOITEGSM  |
      | TC-0324  | 37  | MGVIVOTODAGSM   |
      | TC-0325  | 38  | MGALTOVAL1GSM   |
      | TC-0326  | 38  | MGALTOVAL2GSM   |
      | TC-0327  | 38  | MGCONTROLGSM    |
      | TC-0328  | 38  | MGCTRLEMPGSM    |
      | TC-0329  | 38  | MGFLEX45GSM     |
      | TC-0330  | 38  | MGFLEX85GSM     |
      | TC-0331  | 38  | MGMAISMSGGSM    |
      | TC-0332  | 38  | MGNOITEGSM      |
      | TC-0333  | 38  | MGPREDADOGSM    |
      | TC-0334  | 38  | MGPREDIARIOGSM  |
      | TC-0335  | 38  | MGPREDIAR2GSM   |
      | TC-0336  | 38  | MGPREDIAR3GSM   |
      | TC-0337  | 38  | MGRESPREGSM     |
      | TC-0338  | 38  | MGVIVODIAGSM    |
      | TC-0339  | 38  | MGVIVONOITEGSM  |
      | TC-0340  | 38  | MGVIVOTODAGSM   |
      | TC-0341  | 41  | PRLIVREGSM      |
      | TC-0342  | 41  | PRLIVRE1GSM     |
      | TC-0343  | 41  | PRMAISMSGGSM    |
      | TC-0344  | 41  | PRPREDADOGSM    |
      | TC-0345  | 41  | PRPREDIARIOGSM  |
      | TC-0346  | 41  | PRPREDIAR2GSM   |
      | TC-0347  | 41  | PRPREDIAR3GSM   |
      | TC-0348  | 41  | PRRESPREGSM     |
      | TC-0349  | 41  | PRVIVODIAGSM    |
      | TC-0350  | 41  | PRVIVONOITEGSM  |
      | TC-0351  | 41  | PRVIVOTODAGSM   |
      | TC-0352  | 41  | PRALTOVAL1GSM   |
      | TC-0353  | 41  | PRALTOVAL2GSM   |
      | TC-0354  | 41  | PRBASICOGSM     |
      | TC-0355  | 41  | PRJOVEMGSM      |
      | TC-0356  | 42  | PRALTOVAL1GSM   |
      | TC-0357  | 42  | PRALTOVAL2GSM   |
      | TC-0358  | 42  | PRBASICOGSM     |
      | TC-0359  | 42  | PRJOVEMGSM      |
      | TC-0360  | 42  | PRLIVRE1GSM     |
      | TC-0361  | 42  | PRLIVREGSM      |
      | TC-0362  | 42  | PRMAISMSGGSM    |
      | TC-0363  | 42  | PRPREDADOGSM    |
      | TC-0364  | 42  | PRPREDIAR2GSM   |
      | TC-0365  | 42  | PRPREDIAR3GSM   |
      | TC-0366  | 42  | PRPREDIARIOGSM  |
      | TC-0367  | 42  | PRRESPREGSM     |
      | TC-0368  | 42  | PRVIVODIAGSM    |
      | TC-0369  | 42  | PRVIVONOITEGSM  |
      | TC-0370  | 42  | PRVIVOTODAGSM   |
      | TC-0371  | 43  | PRJOVEMGSM      |
      | TC-0372  | 43  | PRLIVREGSM      |
      | TC-0373  | 43  | PRLIVRE1GSM     |
      | TC-0374  | 43  | PRMAISMSGGSM    |
      | TC-0375  | 43  | PRPREDADOGSM    |
      | TC-0376  | 43  | PRPREDIARIOGSM  |
      | TC-0377  | 43  | PRPREDIAR2GSM   |
      | TC-0378  | 43  | PRPREDIAR3GSM   |
      | TC-0379  | 43  | PRRESPREGSM     |
      | TC-0380  | 43  | PRVIVODIAGSM    |
      | TC-0381  | 43  | PRVIVONOITEGSM  |
      | TC-0382  | 43  | PRVIVOTODAGSM   |
      | TC-0383  | 43  | PRALTOVAL1GSM   |
      | TC-0384  | 43  | PRALTOVAL2GSM   |
      | TC-0385  | 43  | PRBASICOGSM     |
      | TC-0386  | 44  | PRJOVEMGSM      |
      | TC-0387  | 44  | PRLIVREGSM      |
      | TC-0388  | 44  | PRLIVRE1GSM     |
      | TC-0389  | 44  | PRMAISMSGGSM    |
      | TC-0390  | 44  | PRPREDADOGSM    |
      | TC-0391  | 44  | PRPREDIARIOGSM  |
      | TC-0392  | 44  | PRPREDIAR2GSM   |
      | TC-0393  | 44  | PRPREDIAR3GSM   |
      | TC-0394  | 44  | PRRESPREGSM     |
      | TC-0395  | 44  | PRVIVODIAGSM    |
      | TC-0396  | 44  | PRVIVONOITEGSM  |
      | TC-0397  | 44  | PRVIVOTODAGSM   |
      | TC-0398  | 44  | PRALTOVAL1GSM   |
      | TC-0399  | 44  | PRALTOVAL2GSM   |
      | TC-0400  | 44  | PRBASICOGSM     |
      | TC-0401  | 45  | PRJOVEMGSM      |
      | TC-0402  | 45  | PRLIVREGSM      |
      | TC-0403  | 45  | PRLIVRE1GSM     |
      | TC-0404  | 45  | PRMAISMSGGSM    |
      | TC-0405  | 45  | PRPREDADOGSM    |
      | TC-0406  | 45  | PRPREDIARIOGSM  |
      | TC-0407  | 45  | PRPREDIAR2GSM   |
      | TC-0408  | 45  | PRPREDIAR3GSM   |
      | TC-0409  | 45  | PRRESPREGSM     |
      | TC-0410  | 45  | PRVIVODIAGSM    |
      | TC-0411  | 45  | PRVIVONOITEGSM  |
      | TC-0412  | 45  | PRVIVOTODAGSM   |
      | TC-0413  | 45  | PRALTOVAL1GSM   |
      | TC-0414  | 45  | PRALTOVAL2GSM   |
      | TC-0415  | 45  | PRBASICOGSM     |
      | TC-0416  | 46  | PRJOVEMGSM      |
      | TC-0417  | 46  | PRLIVREGSM      |
      | TC-0418  | 46  | PRLIVRE1GSM     |
      | TC-0419  | 46  | PRMAISMSGGSM    |
      | TC-0420  | 46  | PRPREDADOGSM    |
      | TC-0421  | 46  | PRPREDIARIOGSM  |
      | TC-0422  | 46  | PRPREDIAR2GSM   |
      | TC-0423  | 46  | PRPREDIAR3GSM   |
      | TC-0424  | 46  | PRRESPREGSM     |
      | TC-0425  | 46  | PRVIVODIAGSM    |
      | TC-0426  | 46  | PRVIVONOITEGSM  |
      | TC-0427  | 46  | PRVIVOTODAGSM   |
      | TC-0428  | 46  | PRALTOVAL1GSM   |
      | TC-0429  | 46  | PRALTOVAL2GSM   |
      | TC-0430  | 46  | PRBASICOGSM     |
      | TC-0431  | 47  | PRJOVEMGSM      |
      | TC-0432  | 47  | PRLIVREGSM      |
      | TC-0433  | 47  | PRLIVRE1GSM     |
      | TC-0434  | 47  | PRMAISMSGGSM    |
      | TC-0435  | 47  | PRPREDADOGSM    |
      | TC-0436  | 47  | PRPREDIARIOGSM  |
      | TC-0437  | 47  | PRPREDIAR2GSM   |
      | TC-0438  | 47  | PRPREDIAR3GSM   |
      | TC-0439  | 47  | PRRESPREGSM     |
      | TC-0440  | 47  | PRVIVODIAGSM    |
      | TC-0441  | 47  | PRVIVONOITEGSM  |
      | TC-0442  | 47  | PRVIVOTODAGSM   |
      | TC-0443  | 47  | PRALTOVAL1GSM   |
      | TC-0444  | 47  | PRALTOVAL2GSM   |
      | TC-0445  | 47  | PRBASICOGSM     |
      | TC-0446  | 48  | PRJOVEMGSM      |
      | TC-0447  | 48  | PRLIVREGSM      |
      | TC-0448  | 48  | PRLIVRE1GSM     |
      | TC-0449  | 48  | PRMAISMSGGSM    |
      | TC-0450  | 48  | PRPREDADOGSM    |
      | TC-0451  | 48  | PRPREDIARIOGSM  |
      | TC-0452  | 48  | PRPREDIAR2GSM   |
      | TC-0453  | 48  | PRPREDIAR3GSM   |
      | TC-0454  | 48  | PRRESPREGSM     |
      | TC-0455  | 48  | PRVIVODIAGSM    |
      | TC-0456  | 48  | PRVIVONOITEGSM  |
      | TC-0457  | 48  | PRVIVOTODAGSM   |
      | TC-0458  | 48  | PRALTOVAL1GSM   |
      | TC-0459  | 48  | PRALTOVAL2GSM   |
      | TC-0460  | 48  | PRBASICOGSM     |
      | TC-0461  | 49  | PRJOVEMGSM      |
      | TC-0462  | 49  | PRLIVREGSM      |
      | TC-0463  | 49  | PRLIVRE1GSM     |
      | TC-0464  | 49  | PRMAISMSGGSM    |
      | TC-0465  | 49  | PRPREDADOGSM    |
      | TC-0466  | 49  | PRPREDIARIOGSM  |
      | TC-0467  | 49  | PRPREDIAR2GSM   |
      | TC-0468  | 49  | PRPREDIAR3GSM   |
      | TC-0469  | 49  | PRRESPREGSM     |
      | TC-0470  | 49  | PRVIVODIAGSM    |
      | TC-0471  | 49  | PRVIVONOITEGSM  |
      | TC-0472  | 49  | PRVIVOTODAGSM   |
      | TC-0473  | 49  | PRALTOVAL1GSM   |
      | TC-0474  | 49  | PRALTOVAL2GSM   |
      | TC-0475  | 49  | PRBASICOGSM     |
      | TC-0476  | 51  | RSALTOVAL1GSM   |
      | TC-0477  | 51  | RSALTOVAL2GSM   |
      | TC-0478  | 51  | RSBASICOGSM     |
      | TC-0479  | 51  | RSDIAGSM        |
      | TC-0480  | 51  | RSMAISMSGGSM    |
      | TC-0481  | 51  | RSNOITEGSM      |
      | TC-0482  | 51  | RSPREDADOGSM    |
      | TC-0483  | 51  | RSPREDIARIOGSM  |
      | TC-0484  | 51  | RSPREDIAR2GSM   |
      | TC-0485  | 51  | RSPREDIAR3GSM   |
      | TC-0486  | 51  | RSRESPREGSM     |
      | TC-0487  | 51  | RSTODAGSM       |
      | TC-0488  | 51  | RSVIVODIAGSM    |
      | TC-0489  | 51  | RSVIVONOITEGSM  |
      | TC-0490  | 51  | RSVIVOTODAGSM   |
      | TC-0491  | 53  | RSALTOVAL1GSM   |
      | TC-0492  | 53  | RSALTOVAL2GSM   |
      | TC-0493  | 53  | RSBASICOGSM     |
      | TC-0494  | 53  | RSDIAGSM        |
      | TC-0495  | 53  | RSMAISMSGGSM    |
      | TC-0496  | 53  | RSNOITEGSM      |
      | TC-0497  | 53  | RSPREDADOGSM    |
      | TC-0498  | 53  | RSPREDIARIOGSM  |
      | TC-0499  | 53  | RSPREDIAR2GSM   |
      | TC-0500  | 53  | RSPREDIAR3GSM   |
      | TC-0501  | 53  | RSRESPREGSM     |
      | TC-0502  | 53  | RSTODAGSM       |
      | TC-0503  | 53  | RSVIVODIAGSM    |
      | TC-0504  | 53  | RSVIVONOITEGSM  |
      | TC-0505  | 53  | RSVIVOTODAGSM   |
      | TC-0506  | 54  | RSALTOVAL1GSM   |
      | TC-0507  | 54  | RSALTOVAL2GSM   |
      | TC-0508  | 54  | RSBASICOGSM     |
      | TC-0509  | 54  | RSDIAGSM        |
      | TC-0510  | 54  | RSMAISMSGGSM    |
      | TC-0511  | 54  | RSNOITEGSM      |
      | TC-0512  | 54  | RSPREDADOGSM    |
      | TC-0513  | 54  | RSPREDIARIOGSM  |
      | TC-0514  | 54  | RSPREDIAR2GSM   |
      | TC-0515  | 54  | RSPREDIAR3GSM   |
      | TC-0516  | 54  | RSRESPREGSM     |
      | TC-0517  | 54  | RSTODAGSM       |
      | TC-0518  | 54  | RSVIVODIAGSM    |
      | TC-0519  | 54  | RSVIVONOITEGSM  |
      | TC-0520  | 54  | RSVIVOTODAGSM   |
      | TC-0521  | 55  | RSALTOVAL1GSM   |
      | TC-0522  | 55  | RSALTOVAL2GSM   |
      | TC-0523  | 55  | RSBASICOGSM     |
      | TC-0524  | 55  | RSDIAGSM        |
      | TC-0525  | 55  | RSMAISMSGGSM    |
      | TC-0526  | 55  | RSNOITEGSM      |
      | TC-0527  | 55  | RSPREDADOGSM    |
      | TC-0528  | 55  | RSPREDIARIOGSM  |
      | TC-0529  | 55  | RSPREDIAR2GSM   |
      | TC-0530  | 55  | RSPREDIAR3GSM   |
      | TC-0531  | 55  | RSRESPREGSM     |
      | TC-0532  | 55  | RSTODAGSM       |
      | TC-0533  | 55  | RSVIVODIAGSM    |
      | TC-0534  | 55  | RSVIVONOITEGSM  |
      | TC-0535  | 55  | RSVIVOTODAGSM   |
      | TC-0536  | 61  | TCOALTOVAL1GSM  |
      | TC-0537  | 61  | TCOALTOVAL2GSM  |
      | TC-0538  | 61  | TCOLIVREGSM     |
      | TC-0539  | 61  | TCOMAISMSGGSM   |
      | TC-0540  | 61  | TCOPREDADOGSM   |
      | TC-0541  | 61  | TCOPREDIARIOGSM |
      | TC-0542  | 61  | TCOPREDIAR2GSM  |
      | TC-0543  | 61  | TCOPREDIAR3GSM  |
      | TC-0544  | 61  | TCORESPREGSM    |
      | TC-0545  | 61  | TCOVIVODIAGSM   |
      | TC-0546  | 61  | TCOVIVONOITEGSM |
      | TC-0547  | 61  | TCOVIVOTODAGSM  |
      | TC-0548  | 62  | TCOALTOVAL1GSM  |
      | TC-0549  | 62  | TCOALTOVAL2GSM  |
      | TC-0550  | 62  | TCOLIVREGSM     |
      | TC-0551  | 62  | TCOMAISMSGGSM   |
      | TC-0552  | 62  | TCOPREDADOGSM   |
      | TC-0553  | 62  | TCOPREDIARIOGSM |
      | TC-0554  | 62  | TCOPREDIAR2GSM  |
      | TC-0555  | 62  | TCOPREDIAR3GSM  |
      | TC-0556  | 62  | TCORESPREGSM    |
      | TC-0557  | 62  | TCOVIVODIAGSM   |
      | TC-0558  | 62  | TCOVIVONOITEGSM |
      | TC-0559  | 62  | TCOVIVOTODAGSM  |
      | TC-0560  | 63  | TCOALTOVAL1GSM  |
      | TC-0561  | 63  | TCOALTOVAL2GSM  |
      | TC-0562  | 63  | TCOLIVREGSM     |
      | TC-0563  | 63  | TCOMAISMSGGSM   |
      | TC-0564  | 63  | TCOPREDADOGSM   |
      | TC-0565  | 63  | TCOPREDIAR2GSM  |
      | TC-0566  | 63  | TCOPREDIAR3GSM  |
      | TC-0567  | 63  | TCOPREDIARIOGSM |
      | TC-0568  | 63  | TCORESPREGSM    |
      | TC-0569  | 63  | TCOVIVODIAGSM   |
      | TC-0570  | 63  | TCOVIVONOITEGSM |
      | TC-0571  | 63  | TCOVIVOTODAGSM  |
      | TC-0572  | 64  | TCOALTOVAL1GSM  |
      | TC-0573  | 64  | TCOALTOVAL2GSM  |
      | TC-0574  | 64  | TCOLIVREGSM     |
      | TC-0575  | 64  | TCOMAISMSGGSM   |
      | TC-0576  | 64  | TCOPREDADOGSM   |
      | TC-0577  | 64  | TCOPREDIARIOGSM |
      | TC-0578  | 64  | TCOPREDIAR2GSM  |
      | TC-0579  | 64  | TCOPREDIAR3GSM  |
      | TC-0580  | 64  | TCORESPREGSM    |
      | TC-0581  | 64  | TCOVIVODIAGSM   |
      | TC-0582  | 64  | TCOVIVONOITEGSM |
      | TC-0583  | 64  | TCOVIVOTODAGSM  |
      | TC-0584  | 65  | TCOALTOVAL1GSM  |
      | TC-0585  | 65  | TCOALTOVAL2GSM  |
      | TC-0586  | 65  | TCOLIVREGSM     |
      | TC-0587  | 65  | TCOMAISMSGGSM   |
      | TC-0588  | 65  | TCOPREDADOGSM   |
      | TC-0589  | 65  | TCOPREDIARIOGSM |
      | TC-0590  | 65  | TCOPREDIAR2GSM  |
      | TC-0591  | 65  | TCOPREDIAR3GSM  |
      | TC-0592  | 65  | TCORESPREGSM    |
      | TC-0593  | 65  | TCOVIVODIAGSM   |
      | TC-0594  | 65  | TCOVIVONOITEGSM |
      | TC-0595  | 65  | TCOVIVOTODAGSM  |
      | TC-0596  | 66  | TCOALTOVAL1GSM  |
      | TC-0597  | 66  | TCOALTOVAL2GSM  |
      | TC-0598  | 66  | TCOLIVREGSM     |
      | TC-0599  | 66  | TCOMAISMSGGSM   |
      | TC-0600  | 66  | TCOPREDADOGSM   |
      | TC-0601  | 66  | TCOPREDIARIOGSM |
      | TC-0602  | 66  | TCOPREDIAR2GSM  |
      | TC-0603  | 66  | TCOPREDIAR3GSM  |
      | TC-0604  | 66  | TCORESPREGSM    |
      | TC-0605  | 66  | TCOVIVODIAGSM   |
      | TC-0606  | 66  | TCOVIVONOITEGSM |
      | TC-0607  | 66  | TCOVIVOTODAGSM  |
      | TC-0608  | 67  | TCOALTOVAL1GSM  |
      | TC-0609  | 67  | TCOALTOVAL2GSM  |
      | TC-0610  | 67  | TCOLIVREGSM     |
      | TC-0611  | 67  | TCOMAISMSGGSM   |
      | TC-0612  | 67  | TCOPREDADOGSM   |
      | TC-0613  | 67  | TCOPREDIARIOGSM |
      | TC-0614  | 67  | TCOPREDIAR2GSM  |
      | TC-0615  | 67  | TCOPREDIAR3GSM  |
      | TC-0616  | 67  | TCORESPREGSM    |
      | TC-0617  | 67  | TCOVIVODIAGSM   |
      | TC-0618  | 67  | TCOVIVONOITEGSM |
      | TC-0619  | 67  | TCOVIVOTODAGSM  |
      | TC-0620  | 68  | TCOALTOVAL1GSM  |
      | TC-0621  | 68  | TCOALTOVAL2GSM  |
      | TC-0622  | 68  | TCOLIVREGSM     |
      | TC-0623  | 68  | TCOMAISMSGGSM   |
      | TC-0624  | 68  | TCOPREDADOGSM   |
      | TC-0625  | 68  | TCOPREDIAR2GSM  |
      | TC-0626  | 68  | TCOPREDIAR3GSM  |
      | TC-0627  | 68  | TCOPREDIARIOGSM |
      | TC-0628  | 68  | TCORESPREGSM    |
      | TC-0629  | 68  | TCOVIVODIAGSM   |
      | TC-0630  | 68  | TCOVIVONOITEGSM |
      | TC-0631  | 68  | TCOVIVOTODAGSM  |
      | TC-0632  | 69  | TCOALTOVAL1GSM  |
      | TC-0633  | 69  | TCOALTOVAL2GSM  |
      | TC-0634  | 69  | TCOLIVREGSM     |
      | TC-0635  | 69  | TCOMAISMSGGSM   |
      | TC-0636  | 69  | TCOPREDADOGSM   |
      | TC-0637  | 69  | TCOPREDIAR2GSM  |
      | TC-0638  | 69  | TCOPREDIAR3GSM  |
      | TC-0639  | 69  | TCOPREDIARIOGSM |
      | TC-0640  | 69  | TCORESPREGSM    |
      | TC-0641  | 69  | TCOVIVODIAGSM   |
      | TC-0642  | 69  | TCOVIVONOITEGSM |
      | TC-0643  | 69  | TCOVIVOTODAGSM  |
      | TC-0644  | 71  | BAALTOVAL1GSM   |
      | TC-0645  | 71  | BAALTOVAL2GSM   |
      | TC-0646  | 71  | BADIAGSM        |
      | TC-0647  | 71  | BAMAISMSGGSM    |
      | TC-0648  | 71  | BAPREDADOGSM    |
      | TC-0649  | 71  | BAPREDIARIOGSM  |
      | TC-0650  | 71  | BAPREDIAR2GSM   |
      | TC-0651  | 71  | BAPREDIAR3GSM   |
      | TC-0652  | 71  | BARESPREGSM     |
      | TC-0653  | 71  | BAVIVODIAGSM    |
      | TC-0654  | 71  | BAVIVONOITEGSM  |
      | TC-0655  | 71  | BAVIVOTODAGSM   |
      | TC-0656  | 73  | BAALTOVAL1GSM   |
      | TC-0657  | 73  | BAALTOVAL2GSM   |
      | TC-0658  | 73  | BADIAGSM        |
      | TC-0659  | 73  | BAMAISMSGGSM    |
      | TC-0660  | 73  | BAPREDADOGSM    |
      | TC-0661  | 73  | BAPREDIARIOGSM  |
      | TC-0662  | 73  | BAPREDIAR2GSM   |
      | TC-0663  | 73  | BAPREDIAR3GSM   |
      | TC-0664  | 73  | BARESPREGSM     |
      | TC-0665  | 73  | BAVIVODIAGSM    |
      | TC-0666  | 73  | BAVIVONOITEGSM  |
      | TC-0667  | 73  | BAVIVOTODAGSM   |
      | TC-0668  | 74  | BAALTOVAL1GSM   |
      | TC-0669  | 74  | BAALTOVAL2GSM   |
      | TC-0670  | 74  | BADIAGSM        |
      | TC-0671  | 74  | BAMAISMSGGSM    |
      | TC-0672  | 74  | BAPREDADOGSM    |
      | TC-0673  | 74  | BAPREDIARIOGSM  |
      | TC-0674  | 74  | BAPREDIAR2GSM   |
      | TC-0675  | 74  | BAPREDIAR3GSM   |
      | TC-0676  | 74  | BARESPREGSM     |
      | TC-0677  | 74  | BAVIVODIAGSM    |
      | TC-0678  | 74  | BAVIVONOITEGSM  |
      | TC-0679  | 74  | BAVIVOTODAGSM   |
      | TC-0680  | 75  | BAALTOVAL1GSM   |
      | TC-0681  | 75  | BAALTOVAL2GSM   |
      | TC-0682  | 75  | BADIAGSM        |
      | TC-0683  | 75  | BAMAISMSGGSM    |
      | TC-0684  | 75  | BAPREDADOGSM    |
      | TC-0685  | 75  | BAPREDIARIOGSM  |
      | TC-0686  | 75  | BAPREDIAR2GSM   |
      | TC-0687  | 75  | BAPREDIAR3GSM   |
      | TC-0688  | 75  | BARESPREGSM     |
      | TC-0689  | 75  | BAVIVODIAGSM    |
      | TC-0690  | 75  | BAVIVONOITEGSM  |
      | TC-0691  | 75  | BAVIVOTODAGSM   |
      | TC-0692  | 77  | BAALTOVAL1GSM   |
      | TC-0693  | 77  | BAALTOVAL2GSM   |
      | TC-0694  | 77  | BADIAGSM        |
      | TC-0695  | 77  | BAMAISMSGGSM    |
      | TC-0696  | 77  | BAPREDADOGSM    |
      | TC-0697  | 77  | BAPREDIARIOGSM  |
      | TC-0698  | 77  | BAPREDIAR2GSM   |
      | TC-0699  | 77  | BAPREDIAR3GSM   |
      | TC-0700  | 77  | BARESPREGSM     |
      | TC-0701  | 77  | BAVIVODIAGSM    |
      | TC-0702  | 77  | BAVIVONOITEGSM  |
      | TC-0703  | 77  | BAVIVOTODAGSM   |
      | TC-0704  | 79  | BAALTOVAL1GSM   |
      | TC-0705  | 79  | BAALTOVAL2GSM   |
      | TC-0706  | 79  | BADIAGSM        |
      | TC-0707  | 79  | BAMAISMSGGSM    |
      | TC-0708  | 79  | BAPREDADOGSM    |
      | TC-0709  | 79  | BAPREDIARIOGSM  |
      | TC-0710  | 79  | BAPREDIAR2GSM   |
      | TC-0711  | 79  | BAPREDIAR3GSM   |
      | TC-0712  | 79  | BARESPREGSM     |
      | TC-0713  | 79  | BAVIVODIAGSM    |
      | TC-0714  | 79  | BAVIVONOITEGSM  |
      | TC-0715  | 79  | BAVIVOTODAGSM   |
      | TC-0716  | 81  | NEALTOVAL1GSM   |
      | TC-0717  | 81  | NEALTOVAL2GSM   |
      | TC-0718  | 81  | NEMAISMSGGSM    |
      | TC-0719  | 81  | NEPREDADOGSM    |
      | TC-0720  | 81  | NEPREDIARIOGSM  |
      | TC-0721  | 81  | NEPREDIAR2GSM   |
      | TC-0722  | 81  | NEPREDIAR3GSM   |
      | TC-0723  | 81  | NERESPREGSM     |
      | TC-0724  | 81  | NEVIVODIAGSM    |
      | TC-0725  | 81  | NEVIVONOITEGSM  |
      | TC-0726  | 81  | NEVIVOTODAGSM   |
      | TC-0727  | 82  | NEALTOVAL1GSM   |
      | TC-0728  | 82  | NEALTOVAL2GSM   |
      | TC-0729  | 82  | NEMAISMSGGSM    |
      | TC-0730  | 82  | NEPREDADOGSM    |
      | TC-0731  | 82  | NEPREDIARIOGSM  |
      | TC-0732  | 82  | NEPREDIAR2GSM   |
      | TC-0733  | 82  | NEPREDIAR3GSM   |
      | TC-0734  | 82  | NERESPREGSM     |
      | TC-0735  | 82  | NEVIVODIAGSM    |
      | TC-0736  | 82  | NEVIVONOITEGSM  |
      | TC-0737  | 82  | NEVIVOTODAGSM   |
      | TC-0738  | 83  | NEALTOVAL1GSM   |
      | TC-0739  | 83  | NEALTOVAL2GSM   |
      | TC-0740  | 83  | NEMAISMSGGSM    |
      | TC-0741  | 83  | NEPREDADOGSM    |
      | TC-0742  | 83  | NEPREDIARIOGSM  |
      | TC-0743  | 83  | NEPREDIAR2GSM   |
      | TC-0744  | 83  | NEPREDIAR3GSM   |
      | TC-0745  | 83  | NERESPREGSM     |
      | TC-0746  | 83  | NEVIVODIAGSM    |
      | TC-0747  | 83  | NEVIVONOITEGSM  |
      | TC-0748  | 83  | NEVIVOTODAGSM   |
      | TC-0749  | 84  | NEALTOVAL1GSM   |
      | TC-0750  | 84  | NEALTOVAL2GSM   |
      | TC-0751  | 84  | NEMAISMSGGSM    |
      | TC-0752  | 84  | NEPREDADOGSM    |
      | TC-0753  | 84  | NEPREDIARIOGSM  |
      | TC-0754  | 84  | NEPREDIAR2GSM   |
      | TC-0755  | 84  | NEPREDIAR3GSM   |
      | TC-0756  | 84  | NERESPREGSM     |
      | TC-0757  | 84  | NEVIVODIAGSM    |
      | TC-0758  | 84  | NEVIVONOITEGSM  |
      | TC-0759  | 84  | NEVIVOTODAGSM   |
      | TC-0760  | 85  | NEALTOVAL1GSM   |
      | TC-0761  | 85  | NEALTOVAL2GSM   |
      | TC-0762  | 85  | NEMAISMSGGSM    |
      | TC-0763  | 85  | NEPREDADOGSM    |
      | TC-0764  | 85  | NEPREDIARIOGSM  |
      | TC-0765  | 85  | NEPREDIAR2GSM   |
      | TC-0766  | 85  | NEPREDIAR3GSM   |
      | TC-0767  | 85  | NERESPREGSM     |
      | TC-0768  | 85  | NEVIVODIAGSM    |
      | TC-0769  | 85  | NEVIVONOITEGSM  |
      | TC-0770  | 85  | NEVIVOTODAGSM   |
      | TC-0771  | 86  | NEALTOVAL1GSM   |
      | TC-0772  | 86  | NEALTOVAL2GSM   |
      | TC-0773  | 86  | NEMAISMSGGSM    |
      | TC-0774  | 86  | NEPREDADOGSM    |
      | TC-0775  | 86  | NEPREDIARIOGSM  |
      | TC-0776  | 86  | NEPREDIAR2GSM   |
      | TC-0777  | 86  | NEPREDIAR3GSM   |
      | TC-0778  | 86  | NERESPREGSM     |
      | TC-0779  | 86  | NEVIVODIAGSM    |
      | TC-0780  | 86  | NEVIVONOITEGSM  |
      | TC-0781  | 86  | NEVIVOTODAGSM   |
      | TC-0782  | 87  | NEALTOVAL1GSM   |
      | TC-0783  | 87  | NEALTOVAL2GSM   |
      | TC-0784  | 87  | NEMAISMSGGSM    |
      | TC-0785  | 87  | NEPREDADOGSM    |
      | TC-0786  | 87  | NEPREDIARIOGSM  |
      | TC-0787  | 87  | NEPREDIAR2GSM   |
      | TC-0788  | 87  | NEPREDIAR3GSM   |
      | TC-0789  | 87  | NERESPREGSM     |
      | TC-0790  | 87  | NEVIVODIAGSM    |
      | TC-0791  | 87  | NEVIVONOITEGSM  |
      | TC-0792  | 87  | NEVIVOTODAGSM   |
      | TC-0793  | 88  | NEALTOVAL1GSM   |
      | TC-0794  | 88  | NEALTOVAL2GSM   |
      | TC-0795  | 88  | NEMAISMSGGSM    |
      | TC-0796  | 88  | NEPREDADOGSM    |
      | TC-0797  | 88  | NEPREDIARIOGSM  |
      | TC-0798  | 88  | NEPREDIAR2GSM   |
      | TC-0799  | 88  | NEPREDIAR3GSM   |
      | TC-0800  | 88  | NERESPREGSM     |
      | TC-0801  | 88  | NEVIVODIAGSM    |
      | TC-0802  | 88  | NEVIVONOITEGSM  |
      | TC-0803  | 88  | NEVIVOTODAGSM   |
      | TC-0804  | 89  | NEALTOVAL1GSM   |
      | TC-0805  | 89  | NEALTOVAL2GSM   |
      | TC-0806  | 89  | NEMAISMSGGSM    |
      | TC-0807  | 89  | NEPREDADOGSM    |
      | TC-0808  | 89  | NEPREDIARIOGSM  |
      | TC-0809  | 89  | NEPREDIAR2GSM   |
      | TC-0810  | 89  | NEPREDIAR3GSM   |
      | TC-0811  | 89  | NERESPREGSM     |
      | TC-0812  | 89  | NEVIVODIAGSM    |
      | TC-0813  | 89  | NEVIVONOITEGSM  |
      | TC-0814  | 89  | NEVIVOTODAGSM   |
      | TC-0815  | 91  | TCOALTOVAL1GSM  |