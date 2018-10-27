x1=[1 1 1 1 0 0 0];
x2=[1 1 1 1 1 0 0];
XK1=dfs(x1,7);
XK2=dfs(x2,7);
y=idfs(XK1.*XK2,7)