import { createRouter, createWebHistory } from 'vue-router';
import CardList from '../Pages/CardList.vue';
import CreateCard from '../Pages/CreateCards.vue';
import EditCard from '../Pages/Cards/Edit.vue';

const routes = [
    {
        path: '/',
        redirect: '/dashboard',
    },

      {
        path: '/cards',
        name: 'cards',
        component: CardList,
      },
      {
        path: '/cards/:id/edit',
        name: 'cards.edit',
        component: EditCard,
      },


  { path: '/cards/create', name: 'CreateCard', component: CreateCard },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
