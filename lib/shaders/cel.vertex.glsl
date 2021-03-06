#define LAMBERT

varying vec3 vViewPosition;
varying vec3 vNormal;


// /!\ Should be removed, but there is still some part using that somewhere
varying vec3 vLightFront;
#ifdef DOUBLE_SIDED
	varying vec3 vLightBack;
#endif

#include <common>
#include <uv_pars_vertex>
#include <uv2_pars_vertex>
#include <envmap_pars_vertex>
#include <bsdfs>
#include <lights_pars>
#include <color_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>

void main() {

	#include <uv_vertex>
	#include <uv2_vertex>
	#include <color_vertex>

	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>

	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>

	#include <worldpos_vertex>
	#include <envmap_vertex>
	
	// Start of mod
	//#include <lights_lambert_vertex>
	
	// Pass position to the fragment shader: it should compute the light by itself
	vNormal = normalize( transformedNormal );
	vViewPosition = mvPosition.xyz;
	// End of mod
	
	#include <shadowmap_vertex>

}
