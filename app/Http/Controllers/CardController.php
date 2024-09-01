<?php

namespace App\Http\Controllers;

use App\Models\Card;
use Illuminate\Http\Request;




use Inertia\Inertia;

class CardController extends Controller
{
    public function store(Request $request)
    {
        Card::create(
            $request->validate([
                'card_number' => ['required', 'max:20'],
                'pin' => ['required', 'max:4'],
                'activation_date' => ['required'],
                'expiration_date' => ['required'],
                'balance' => ['required'],
            ])
            );
            return redirect('/cards');
        }
    public function create()
    {
        return Inertia::render('CreateCards');
    }


    // Inne metody, takie jak store, index, itp.
    public function index()
    {
        $cards = Card::paginate(10);
        return Inertia::render('CardList', [
            'cards' => $cards
        ]);
    }
    public function show($id)
    {
        // Zwraca szczegóły wybranej karty
    }

    public function update(Request $request, Card $card)
    {
        $validated = $request->validate([
            'card_number' => 'required|digits:20|unique:cards,card_number,' . $card->id,
            'pin' => 'required|digits:4',
            'activation_date' => 'required|date',
            'expiration_date' => 'required|date',
            'balance' => 'required|numeric'
        ]);

        $card->update($validated);

        return redirect()->route('cards.index');
    }


    public function destroy(Card $card)
    {
        $card->delete();
        return redirect('/cards');
    }

    public function edit(Card $card)
    {
    return inertia('Cards/Edit', [
        'card' => $card,
    ]);

    }

}

