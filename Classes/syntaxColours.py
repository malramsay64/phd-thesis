
import husl
def latex_rgb(rgb):
    r,g,b = rgb
    return "{"+'{r:.5f},{g:.5f},{b:.5f}'.format(r=abs(r),g=abs(g),b=abs(b))+'}'

s = 100
l = 30
print r'\definecolor{myred}{rgb}'+latex_rgb(husl.husl_to_rgb(50,s,l))
print r'\definecolor{myyellow}{rgb}'+latex_rgb(husl.husl_to_rgb(65,s,l))
print r'\definecolor{mygreen}{rgb}'+latex_rgb(husl.husl_to_rgb(140,s,l))
print r'\definecolor{myblue}{rgb}'+latex_rgb(husl.husl_to_rgb(250,s,l))
print r'\definecolor{mypurple}{rgb}'+latex_rgb(husl.husl_to_rgb(295,s,l))
print r'\definecolor{mygrey}{rgb}'+latex_rgb(husl.husl_to_rgb(0,0,l))

