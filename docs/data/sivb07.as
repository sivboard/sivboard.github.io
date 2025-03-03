﻿
void Main()
{
    Font font(60);
    Font emoji(60, Typeface::MonochromeEmoji);
    font.addFallback(emoji);

    double size = 100;
    double force = 200;
    HSV color = HSV(60, 0.5, 1.0, 0.8);
    size_t index = 0;
    size_t type = 0;
    bool random = false;
    bool init = true;

    RectEmitter2D rectEmitter;
    ParticleSystem2D particleSystem();
    ParticleSystem2DParameters parameters;
    parameters.startAngularVelocityDeg = 100;
    parameters.startLifeTime = 10;
    parameters.maxParticles = 5000;
    parameters.blendState = BlendState::Additive;

    Array<Texture> texture = { Texture(Icon::CreateImage(0xf005, 50)), Texture(Icon::CreateImage(0xf06c, 50)), Texture(Icon::CreateImage(0xf2dc, 50)) };

    while (System::Update())
    {
        particleSystem.update();
        particleSystem.draw();

        SimpleGUI::Slider("Rate", parameters.rate, 10, 100, Vec2(740, 20));
        SimpleGUI::Slider("Size", size, 0, 200, Vec2(740, 60));
        SimpleGUI::Slider("Force", force, 0, 400, Vec2(740, 100));

        SimpleGUI::Slider("Color H", color.h, 0.0, 360, Vec2(740, 180));
        SimpleGUI::Slider("Color S", color.s, 0.0, 1.0, Vec2(740, 220));
        SimpleGUI::Slider("Color V", color.v, 0.0, 1.0, Vec2(740, 260));
        SimpleGUI::Slider("Color A", color.a, 0.0, 1.0, Vec2(740, 300));

        SimpleGUI::CheckBox(random, "Random Color", Vec2(740, 340), 200);

        if (init || SimpleGUI::RadioButtons(type, { "Blow", "Fall" }, Vec2(740, 380), 200))
        {
            if (type == 0)
            {
                particleSystem.setPosition(Vec2(-200, Scene::Center().y));
                rectEmitter.width = 200;
                rectEmitter.height = Scene::Height() * 2;
            }
            else
            {
                particleSystem.setPosition(Vec2(Scene::Center().x, -200));
                rectEmitter.width = Scene::Width() * 2;
                rectEmitter.height = 200;
            }
            particleSystem.setEmitter(rectEmitter);
        }

        if (init || SimpleGUI::RadioButtons(index, { "Star", "Leaf", "Snow" }, Vec2(740, 460), 200))
        {
            particleSystem.setTexture(texture[index]);
        }

        if (type == 0) { particleSystem.setForce(Vec2(force, -force * 0.5)); }
        else { particleSystem.setForce(Vec2(-force * 0.5, force)); }

        if (random) { parameters.startColor = HSV(Random(360), color.s, color.v, color.a); }
        else { parameters.startColor = color; }

        parameters.startSize = Random(size, size * 0.2);
        particleSystem.setParameters(parameters);

        font("Hello, SivBoard!🐣").drawAt(Scene::Center(), ColorF(0.5, 0.5));
        init = false;
    }
}