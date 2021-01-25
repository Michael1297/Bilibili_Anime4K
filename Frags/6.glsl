uniform sampler2D HOOKED;
uniform sampler2D LUMAN1;
uniform sampler2D LUMAN2;
uniform sampler2D LUMAN3;
uniform sampler2D LUMAN4;
uniform sampler2D LUMAN5;
uniform sampler2D NATIVE;
uniform vec2 HOOKED_pt;
varying vec2 HOOKED_pos;

vec4 HOOKED_tex(vec2 pos) {
    return texture2D(HOOKED, pos);
}
vec4 LUMAN1_tex(vec2 pos) {
    return texture2D(LUMAN1, pos);
}
vec4 LUMAN2_tex(vec2 pos) {
    return texture2D(LUMAN2, pos);
}
vec4 LUMAN3_tex(vec2 pos) {
    return texture2D(LUMAN3, pos);
}
vec4 LUMAN4_tex(vec2 pos) {
    return texture2D(LUMAN4, pos);
}
vec4 LUMAN5_tex(vec2 pos) {
    return texture2D(LUMAN5, pos);
}
vec4 NATIVE_tex(vec2 pos) {
    return texture2D(NATIVE, pos);
}

//!DESC Anime4K-v3.1-Upscale(x2)+Deblur-CNN(M)-Conv-Reduce
//!HOOK NATIVE
//!BIND HOOKED
//!WHEN OUTPUT.w NATIVE.w / 1.200 > OUTPUT.h NATIVE.h / 1.200 > *
//!BIND LUMAN1
//!BIND LUMAN2
//!BIND LUMAN3
//!BIND LUMAN4
//!BIND LUMAN5
//!SAVE LUMAN0
//!COMPONENTS 4

void main() {
	vec2 dp = HOOKED_pt;
	vec4 a = LUMAN1_tex(HOOKED_pos);
	vec4 b = LUMAN2_tex(HOOKED_pos);
	vec4 c = LUMAN3_tex(HOOKED_pos);
	vec4 d = LUMAN4_tex(HOOKED_pos);
	vec4 e = LUMAN5_tex(HOOKED_pos);
	
	vec4 na = -min(a, vec4(0));
	vec4 nb = -min(b, vec4(0));
	vec4 nc = -min(c, vec4(0));
	vec4 nd = -min(d, vec4(0));
	vec4 ne = -min(e, vec4(0));
	
	a = max(a, vec4(0));
	b = max(b, vec4(0));
	c = max(c, vec4(0));
	d = max(d, vec4(0));
	e = max(e, vec4(0));

	float o = 0.016170086*a.x + -0.07807932*a.y + -0.01608141*a.z + 0.04596583*a.w + 0.0010671375*na.x + 0.13604787*na.y + -0.103508055*na.z + -0.053727165*na.w + 0.05931074*b.x + -0.03741526*b.y + 0.007310368*b.z + 0.021383934*b.w + 0.07797022*nb.x + 0.010276286*nb.y + -0.044151705*nb.z + 0.018349322*nb.w + -0.10480624*c.x + -0.19607827*c.y + -0.017716367*c.z + -0.03210694*c.w + 0.030397506*nc.x + 0.13205609*nc.y + 0.027324466*nc.z + 0.011638977*nc.w + -0.046764173*d.x + -0.14180084*d.y + -0.041110236*d.z + -0.3233351*d.w + -0.13833268*nd.x + 0.35512686*nd.y + -0.08653635*nd.z + -0.15801503*nd.w + -0.26316383*e.x + -0.2056243*e.y + -0.09891177*e.z + 0.09735771*e.w + 0.17222679*ne.x + 0.10222737*ne.y + 0.17698137*ne.z + -0.045976873*ne.w + -0.016519222;
	float p = -0.0070673134*a.x + -0.10279413*a.y + -0.030861663*a.z + 0.019370042*a.w + -0.0014143038*na.x + 0.05432107*na.y + -0.15635669*na.z + -0.05455238*na.w + 0.027550258*b.x + 0.014056243*b.y + -0.016198097*b.z + 0.03419058*b.w + -0.004207751*nb.x + -0.0113672*nb.y + 0.034180697*nb.z + 0.04015298*nb.w + -0.06339332*c.x + 0.0036280584*c.y + -0.010639602*c.z + 0.026508855*c.w + -0.02524984*nc.x + 0.11936996*nc.y + -0.031202994*nc.z + -0.021372601*nc.w + -0.025080366*d.x + -0.021841787*d.y + 0.06487728*d.z + -0.06460682*d.w + 0.04119384*nd.x + -0.008643975*nd.y + -0.2078446*nd.z + 0.11259166*nd.w + -0.10560037*e.x + 0.14785078*e.y + 0.1384287*e.z + -0.06915313*e.w + 0.010694984*ne.x + -0.034556255*ne.y + -0.03377371*ne.z + 0.06635877*ne.w + -0.002248366;
	float q = 0.02117986*a.x + -0.051776726*a.y + 0.15544093*a.z + 0.070309296*a.w + -0.011411071*na.x + 0.0055163414*na.y + 0.06413486*na.z + -0.045615938*na.w + 0.033726115*b.x + -0.052270424*b.y + 0.019222505*b.z + 0.02011268*b.w + -0.11609392*nb.x + 0.033497345*nb.y + -0.06132894*nb.z + -0.10658528*nb.w + 0.038067166*c.x + 0.086731836*c.y + 0.08148008*c.z + 0.010150495*c.w + -0.016870074*nc.x + 0.01104681*nc.y + 0.009952575*nc.z + 0.020137098*nc.w + -0.06427216*d.x + -0.12534674*d.y + -0.09109642*d.z + -0.46550632*d.w + -0.1370387*nd.x + 0.24063608*nd.y + -0.33579165*nd.z + -0.08938409*nd.w + -0.09131308*e.x + -0.17998323*e.y + -0.33354574*e.z + -0.20851119*e.w + 0.21100727*ne.x + 0.0667875*ne.y + 0.23766036*ne.z + 0.10573718*ne.w + -0.023920521;
	float r = -0.06296154*a.x + 0.06051705*a.y + 0.11386459*a.z + 0.019399049*a.w + -0.015610163*na.x + 0.0037772388*na.y + 0.04038177*na.z + 0.020901382*na.w + 0.0468376*b.x + 0.004552797*b.y + 0.08530895*b.z + -0.0020661093*b.w + -0.075115256*nb.x + 0.01650069*nb.y + 0.025982859*nb.z + -0.063966826*nb.w + 0.14024706*c.x + 0.03896333*c.y + -0.070236415*c.z + 0.013854423*c.w + -0.023396354*nc.x + -0.10749727*nc.y + 0.018419292*nc.z + 0.0051121856*nc.w + -0.098157406*d.x + -0.24840991*d.y + -0.01761279*d.z + -0.48552045*d.w + -0.11399571*nd.x + 0.2751265*nd.y + -0.4713016*nd.z + 0.009285934*nd.w + -0.11395686*e.x + 0.04294104*e.y + -0.33598495*e.z + 0.14753135*e.w + 0.18233627*ne.x + 0.06840005*ne.y + 0.23921333*ne.z + -0.087927036*ne.w + -0.020836344;

	gl_FragColor = vec4(o, p, q, r);
}

