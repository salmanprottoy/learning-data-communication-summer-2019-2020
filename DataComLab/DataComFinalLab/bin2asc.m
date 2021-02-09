function txt = bin2asc(dn)
L=length(dn); 
L8=8*floor(L/8); 
B=reshape(dn(1:L8),8,L8/8); 
p2=2.^(0:7); 
dec=p2*B; 
txt=char(dec); 
end