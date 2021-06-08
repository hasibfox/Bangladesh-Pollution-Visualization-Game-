function [s] = functionpractice(x,y,cities,v1,v2)
        t = tiledlayout("flow");
        nexttile(t);
        s = scatter(x,y);
        dy = 0.05;
        text(x,y + dy, cities, "HorizontalAlignment", "center","VerticalAlignment", "bottom");
        axis("padded");
        xlabel(v1) ;
        ylabel(v2) ;
        title(v1 + " versus " + v2);
end