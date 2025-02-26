import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseUtils {
   late SupabaseClient instance;
   Future<void> init() async {
     await Supabase.initialize(url: 'https://xpifazzejkwppxxeguux.supabase.co',
         anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhwaWZhenplamt3cHB4eGVndXV4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTUwNDQ3MzksImV4cCI6MjAxMDYyMDczOX0.B9Oo7VbwBKOYlaJavgkXM7YQ_fDvRYVxBI_4A1pL46c');
     instance = Supabase.instance.client;
   }
}