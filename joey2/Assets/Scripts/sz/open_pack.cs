using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class open_pack : MonoBehaviour
{


    public GameObject cardPrefab;
    public GameObject pool;
    Store store;
    List<GameObject> cardList = new List<GameObject>();





    // Start is called before the first frame update
    void Start()
    {
        store = GetComponent<Store>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }


    public void OnClickOpen()
    {
        ClearPool();
        for (int i = 0; i < 5; i++)
        {
            GameObject newCard = GameObject.Instantiate(cardPrefab, pool.transform);
            newCard.GetComponent<CardDisplay>().card = store.RandomCard();

            newCard.GetComponent<CardDisplay>().ShowCard(); // 在设置完card后手动调用ShowCard更新显示
            cardList.Add(newCard);
        }
    }

    public void ClearPool()
    {
        foreach (var card in cardList)
        {
            Destroy(card);
        }
        cardList.Clear();
    }



}
