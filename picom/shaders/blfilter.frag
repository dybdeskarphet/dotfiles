#version 330

in vec2 texcoord;
uniform sampler2D tex;
uniform float opacity;

vec4 default_post_processing(vec4 c);

vec4 window_shader() {
    vec2 texsize = textureSize(tex, 0);
    vec4 pixColor = texture2D(tex, texcoord / texsize, 0);

    // Apply the blue light filter
    // Adjusting green and blue channels
    pixColor.g *= 0.855;
    pixColor.b *= 0.725;

    // Apply opacity
    pixColor *= opacity;

    return default_post_processing(pixColor);
}
