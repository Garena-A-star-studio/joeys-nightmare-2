using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Card 
{
    public int id;
    public string name;
    public string description;
    public Card(int _id, string _name, string _description)
    {
        this.id = _id;
        this.name = _name;
        this.description = _description;
    }

}


public class EnemyCard : Card
{
    public int hp;
    public int current_hp;
    public int attack;
    public int current_attack;

    public EnemyCard(int _id, string _name, string _description, int _hp, int _attack) : base(_id, _name, _description)
    {
        this.hp = _hp;
        this.current_hp = _hp;
        this.attack = _attack;
        this.current_attack = _attack;
    }


}


public class ItemkCard : Card
{
    public int attack;
    public int current_attack;
    public int heal;
    public int current_heal;
    public ItemCard(int _id, string _name, string _description, int _attack, int _heal) : base(_id, _name, _description)
    {
        this.attack = _attack;
        this.current_attack = _attack;
        this.heal = _heal;
        this.current_heal = _heal;
    }
}


