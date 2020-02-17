function B = computeBarycentric(p,UV,F)
%     Vector v0 = b - a, v1 = c - a, v2 = p - a;
%     float d00 = Dot(v0, v0);
%     float d01 = Dot(v0, v1);
%     float d11 = Dot(v1, v1);
%     float d20 = Dot(v2, v0);
%     float d21 = Dot(v2, v1);
%     float denom = d00 * d11 - d01 * d01;
%     v = (d11 * d20 - d01 * d21) / denom;
%     w = (d00 * d21 - d01 * d20) / denom;
%     u = 1.0f - v - w;

    a = UV(F(:,1),:);
    b = UV(F(:,2),:);
    c = UV(F(:,3),:);
    
    nF = size(F,1);
    v0 = b - a;
    v1 = c - a;
    v2 = repmat(p,nF,1) - a;
    
    d00 = sum(v0 .* v0,2);
    d01 = sum(v0 .* v1,2);
    d11 = sum(v1 .* v1,2);
    d20 = sum(v2 .* v0,2);
    d21 = sum(v2 .* v1,2);
    denom = d00 .* d11 - d01 .* d01;
    v = (d11 .* d20 - d01 .* d21) ./ denom;
    w = (d00 .* d21 - d01 .* d20) ./ denom;
    u = 1 - v - w;
    
    B = [u,v,w];
end