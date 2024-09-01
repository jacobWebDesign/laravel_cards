<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head } from '@inertiajs/vue3';
import { ref } from 'vue';
import { usePage } from '@inertiajs/vue3';
import { router } from '@inertiajs/vue3';

const { props } = usePage();
const cards = ref(props.cards);

const deleteCard = (id) => {
  if (confirm('Are you sure you want to delete this card?')) {
    router.delete(route('cards.destroy', id));
  }
};

const nextPage = () => {
  if (cards.value.next_page_url) {
    router.visit(cards.value.next_page_url);
  }
};

const previousPage = () => {
  if (cards.value.prev_page_url) {
    router.visit(cards.value.prev_page_url);
  }
};
</script>

<template>
    <Head title="Dashboar"/>

    <AuthenticatedLayout>


        <div>
    <div class="min-h-screen bg-gray-100">


      <!-- Page Content -->
      <main>

      </main>
    </div>
  </div>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">Masz mały penis</div>
                </div>
            </div>
        </div>



    </AuthenticatedLayout>
</template>
