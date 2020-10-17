//arguments [player, dusteffect, scale, xshift, yshift]
xPosition = argument0.x + argument3
yPosition = argument0.y + argument4
dustEffect = argument1
scale = argument2
var obj = instance_create_layer(xPosition, yPosition, "DustEffects", dustEffect)
obj.image_xscale = scale;
obj.image_yscale = scale;
obj.add_movement = true;
obj.delay = 0;
if(dustEffect == objCollisionDust){
	obj.side = sign(argument0.hspeed) + 1
}