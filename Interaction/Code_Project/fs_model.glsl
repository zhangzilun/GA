#version 410 core

out vec4 color;


in VS_OUT
{
    vec3 vertex;
    vec3 normals;
    vec2 tc;
} fs_in;

uniform sampler2D tex;
uniform mat4 model_matrix;
uniform vec3 materialColor;
uniform vec3 lightColor;


glUniform4f(glGetUniformLocation(objectModel.pro
gram, "lightPosition"), lightDisp.x, 
lightDisp.y, lightDisp.z, 1.0);

glUniformMatrix4fv(glGetUniformLocation(objectMo
del.program, "view_matrix"), 1, GL_FALSE, 
&viewMatrix[0][0]);


void main(void){


color = vec4( ka * ia , 1.0) + diffuse;
}

void main(void){
  //color = vec4(1.0,1.0,1.0,1.0);
  //color = vec4(fs_in.normals, 1.0);

  color = texture(tex, fs_in.tc);
vec3 normalsT = mat3(transpose(inverse(model_matrix))) *                
vec3(fs_in.normals.xyz);
vec4 normal = normalize(vec4(normalsT, 1.0));
vec4 lightDir = normalize(lightPosition - fs_in.fragPos);
float diff = max(dot(normal, lightDir), 0.0);
vec4 diffuse = diff * vec4(1.0, 1.0, 1.0, 1.0);
color = vec4( ka * ia , 1.0) + diffuse;

}


