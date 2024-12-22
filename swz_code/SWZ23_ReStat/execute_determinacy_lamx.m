clear
close all
cd('model')

% idea is to fix lamx and lampi, and then loop over phix and phipi to
% see where we get the right # of unstable eigenvalues

lamx = 0;
lampi = 0;
beta = 0.995;
z = 0.33;
sigma = 1;
bfi = 0.7;
bcb = 1-bfi;
gamma = 0.086;
zeta = 2;
rhor = 0.8;
rhoq = 0.8;
Ppi = [0.5:0.0005:4]; % phipi grid
Px = [0:0.0005:2]; % phix grid

Tx = [0 -1.5 -5 -15]; % grid of lamx points
np = size(Ppi,2); % # of phipi points
nx = size(Px,2); % # of phix points

% place to collect number of unstable eigenvalues
NU = zeros(np,nx,4);
for k = 1:4
for j = 1:nx
    for i = 1:np
        [k,j,i]
        lamx = Tx(k);
        phix = Px(j);
        phipi = Ppi(i);
        
A = [];
eA = [];
B1 = zeros(4,4);
B2 = zeros(4,4);

B1(1,1) = 1 - z*bcb*(1-rhoq)*lamx;
B1(1,2) = (1-z)/sigma - z*bcb*(1-rhoq)*lampi;
B1(1,3) = -(1-z)/sigma;
B1(1,4) = z*bcb*(1-rhoq);
B1(2,2) = beta;
B1(2,4) = -(z*gamma*sigma/(1-z))*bcb;
B1(3,3) = 1;
B1(4,4) = 1;

B2(1,1) = 1;
B2(2,1) = -gamma*zeta;
B2(2,2) = 1;
B2(3,1) = (1-rhor)*phix;
B2(3,2) = (1-rhor)*phipi;
B2(3,3) = rhor;
B2(4,1) = (1-rhoq)*lamx;
B2(4,2) = (1-rhoq)*lampi;
B2(4,4) = rhoq;

A = B1\B2;

% need eigenvalues of A
eA = abs(eig(A)); % modulus
eA = sort(eA,'descend'); % sort them smallest to largest

% count unstable eigenvalues
num_unst = sum(eA>1.0000000);
NU(i,j,k) = num_unst;

    end
end
end

% Now find the combos that generate determinacy
combo = zeros(4,nx);

for k = 1:4
for j = 1:nx
    g = find(NU(:,j,k)-1,1);
    combo(k,j) = Ppi(g);
end
end

figure
plot(Px,combo(1,:),'-k',Px,combo(2,:),'--b',Px,combo(3,:),':r',Px,combo(4,:),'-.m','Linewidth',2)
xlabel('\phi_{x}')
ylabel('\phi_{\pi}')
grid on
legend('\lambda_{x} = 0','\lambda_{x} = 1.5','\lambda_{x} = 5','\lambda_{x} = 15')
    
save('determinancy_lamx.mat','Px','combo') 