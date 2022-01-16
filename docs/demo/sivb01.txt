void Main()
{
    Font font(60);
    Font emoji(60, Typeface::MonochromeEmoji);
    font.addFallback(emoji);

    ParticleSystem2D ps(Scene::Center());
    CircleEmitter2D e;
    e.sourceRadius = Scene::Width();
    ps.setEmitter(e);

    ParticleSystem2DParameters p;
    p.startSize = 100;
    p.startLifeTime = 10;
    p.startAngularVelocityDeg = 100;

    while (System::Update())
    {
        ClearPrint();
        Print << Profiler::FPS() << " fps";

        p.startColor = HSV(360 * Periodic::Sawtooth0_1(30), 0.5, 1, 0.5);
        ps.setParameters(p);
        ps.update();
        ps.draw();

        font("Hello, SivBoard!🐣").drawAt(Scene::Center(), p.startColor);
    }
}