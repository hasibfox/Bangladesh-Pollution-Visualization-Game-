function [s] = makeGraph(x,y,cities,v1,v2, style)
        c = [0 1 0; 1 0 0; 0.5 0.5 0.5; 0.6 0 1;1 1 0; 1 0 1; 0 1 1; 0 0 1;0 0 0; 1 0.4 0.6; 0.2 0.2 0.2; 0.9 0.4 1];
        s = scatter(x,y, [], c, style);
        dy = 1;
        dx = 1;
        text(x + dx,y + dy, cities, "HorizontalAlignment", "center","VerticalAlignment", "bottom");
        axis("padded");
        xlabel(v1) ;
        ylabel(v2) ;
        title(v1 + " versus " + v2);
end