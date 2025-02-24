// SivBoard - ver.2.50.2
// URL: https://sivboard.github.io/
// This script code was auto-generated.

void Main()
{
    SivB::Board::Reset();
    //SivB::Script::Control(false);
    //Font font(60);

    SivB::Board::Load("sivb_anim", "zip", 1);
    SivB::Board::Load("sivb_balloon.png", 2);
    SivB::Board::Load("sivb_text.txt", 3);
    SivB::Board::Load("sivb_text.txt", 4);

    SivB::Board::Items(1).pos(Vec2(480, 360)).scale(1.60).angle(0.00).alpha(1.00).light(0.50).style(0).step(0).hide(false).lock(true);
    SivB::Board::Items(2).pos(Vec2(780, 450)).scale(0.90).angle(0.00).alpha(1.00).light(0.50).style(1).step(0).hide(false).lock(false);
    SivB::Board::Items(3).pos(Vec2(785, 450)).scale(1.20).angle(0.00).alpha(1.00).light(0.00).style(8).step(1).hide(false).lock(false);
    SivB::Board::Items(4).pos(Vec2(480, 120)).scale(1.80).angle(-1.00).alpha(1.00).light(0.70).style(2).step(0).hide(false).lock(false);

    SivB::Item item = SivB::Board::Items(1);
    SivB::Part part(item, SivB::Item(item).step(item.stepMax()));

    //SivB::Script::Exit();

    while (System::Update())
    {
        SivB::Board::Items(1) = part.get(EaseOutExpo(Periodic::Sawtooth0_1(1)));
        SivB::Board::Draw();
        //font("Hello, SivBoard!").drawAt(Scene::Center(), Palette::White);
    }
}
