gloo_user_emails <- 'ashiemke@tangogroup.com,abooysen@tangogroup.com,alauderdale@tangogroup.com,ataujenis@tangogroup.com,ashafer@tangogroup.com,apreger@tangogroup.com,becky@tangogroup.com,bgreeno@tangogroup.com,btremper@tangogroup.com,bboylan@tangogroup.com,bbonifiled@tangogroup.com,bschafer@tangogroup.com,byoung.hsp@gmail.com,broberts@tangogroup.com,bgrayless@tangogroup.com,bjohnson@tangogroup.com,bmcevoy@tangogroup.com,bsaltshalcomb@tangogroup.com,bturney@tangogroup.com,carolynleeturney@gmail.com,cgoodroe@tangogroup.com,cjoyce@tangogroup.com,cmarks@tangogroup.com,csmola@tangogroup.com,chebets@tangogroup.com,crogers@tangogroup.com,corey@capelio.com,dgunter@tangogroup.com,dclements@tangogroup.com,dmingo@tangogroup.com,drouch@tangogroup.com,dkline@tangogroup.com,dwilson@tangogroup.com,ehahn@tangogroup.com,elehnert@tangogroup.com,etoy@tangogroup.com,eschurter@tangogroup.com,eoneil@tangogroup.com,eguin@tangogroup.com,enava@tangogroup.com,eshirk@tangogroup.com,eswanson@tangogroup.com,hellerbach@tangogroup.com,jstewart@tangogroup.com,jjacobsen@tangogroup.com,jvandenberge@tangogroup.com,jswearingen@tangogroup.com,jtilley@tangogroup.com,jwenell@tangogroup.com,jeffcaliguire@tangogroup.com,jfray@tangogroup.com,jbojar@tangogroup.com,jfishbaugh@tangogroup.com,jandres@tangogroup.com,jhinegardner@tangogroup.com,jmaron@tangogroup.com,jhower@tangogroup.com,jcaliguire@tangogroup.com,jkuster@tangogroup.com,jcoombs@tangogroup.com,jofray@tangogroup.com,jneighbors@tangogroup.com,jashby@tangogroup.com,jchadbourne@tangogroup.com,jvallelonga+notesting@tangogroup.com,ksmith@tangogroup.com,kjeremko@tangogroup.com,kaubertot@tangogroup.com,kclingersmith@tangogroup.com,kmorrison@tangogroup.com,lweiner@tangogroup.com,lbowdey@tangogroup.com,lmashkouri@tangogroup.com,lmarks@tangogroup.com,lswanson@tangogroup.com,mgraham@tangogroup.com,mlupa@tangogroup.com,msmay@tangogroup.com,mdavis@tangogroup.com,mmcconnell@tangogroup.com,mkatz@tangogroup.com,mgubba@tangogroup.com,mtrubacz@tangogroup.com,mindy.caliguire@tangogroup.com,mlarsen@tangogroup.com,mgingrich@tangogroup.com,nsmith@tangogroup.com,nykema@tanogroup.com,nick.smith@tangogroup.com,nvalencia@tangogroup.com,nclark@tangogroup.com,pceron@tangogroup.com,pkeller@tangogroup.com,peterhan777@gmail.com,plarson@tangogroup.com,rhughey@tangogroup.com,rschirmer@tangogroup.com,rmoses@tangogroup.com,rcarpenter@tangogroup.com,rortiz@tangogroup.com,rholdeman@tangogroup.com,Ryanrtr@gmail.com,sunrein@tangogroup.com,smccord@tangogroup.com,styson@tangogroup.com,beck@tangogroup.com,smalone@tangogroup.com,ssymmank@tangogroup.com,sconnolly17@gmail.com,staylor@tangogroup.com,shannon@bertucc.io, slindow@tangogroup.com,serskine86@gmail.com,smefford@tangogroup.com,slaflora@tangogroup.com,sdilla@gmail.com,stuart@tangogroup.com,selam@tangogroup.com,swehrly@tangogroup.com,srinehart@tangogroup.com,twolters@tangogorup.com,tclary@tangogroup.com,trichards@tangogroup.com,ttuck@tangogroup.com,tgroom@tangogroup.com,tyler.r.briggs89@gmail.com,tory@tangogroup.com,vvigil@tangogroup.com,wlorenzen@tangogroup.com,wemerson@tangogroup.com'
gloo_user_emails <- strsplit(gloo_user_emails, ',')[[1]]

devtools::use_data(gloo_user_emails, overwrite = T)
