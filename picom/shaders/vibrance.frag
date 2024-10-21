#version 330

in vec2 texcoord;
uniform sampler2D tex;
uniform float opacity;

vec4 default_post_processing(vec4 c);

vec4 window_shader() {
    vec2 texsize = textureSize(tex, 0);
    vec4 pixColor = texture2D(tex, texcoord / texsize, 0);

    // Apply vibrance adjustment
    vec3 color = vec3(pixColor.r, pixColor.g, pixColor.b);

    // Constants as defined in the original shader
    const vec3 VIB_RGB_BALANCE = vec3(1.0, 1.0, 1.0);
    const float VIB_VIBRANCE = 0.15;
    const vec3 VIB_coeffVibrance = VIB_RGB_BALANCE * -VIB_VIBRANCE;

    // Calculate luma using the selected coefficients
    vec3 VIB_coefLuma = vec3(0.212656, 0.715158, 0.072186);
    float luma = dot(VIB_coefLuma, color);

    // Calculate color saturation
    float max_color = max(color.r, max(color.g, color.b));
    float min_color = min(color.r, min(color.g, color.b));
    float color_saturation = max_color - min_color;

    // Apply vibrance
    vec3 p_col = vec3((sign(VIB_coeffVibrance) * color_saturation - 1.0) * VIB_coeffVibrance + 1.0);
    pixColor.r = mix(luma, color.r, p_col.r);
    pixColor.g = mix(luma, color.g, p_col.g);
    pixColor.b = mix(luma, color.b, p_col.b);

    // Apply opacity
    pixColor *= opacity;

    return default_post_processing(pixColor);
}
